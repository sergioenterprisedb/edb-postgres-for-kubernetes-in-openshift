#!/bin/bash
. ./config.sh
. ./primary.sh

#Doc
echo "19" > ./docs/docid

pitr_date=$(${kubectl_cmd} exec -it ${primary} -- psql -U postgres -X -A -t -c "select min(timestamp+interval '1 second') from test;") 
print_info "Restore date: ${red}${pitr_date%?}\n"

cat > ./pitr/restore.yaml <<EOF
apiVersion: postgresql.k8s.enterprisedb.io/v1
kind: Cluster
metadata:
  name: '$cluster_restore'
spec:
  instances: 1
  imageName: '$postgres_upgrade_image'

  storage:
    size: $postgres_storage

  bootstrap:
    recovery:
      source: ${cluster_name}
      recoveryTarget:
        targetTime: '${pitr_date%?}'
        #backupID: 20230411T115526

  externalClusters:
    - name: ${cluster_name}
      barmanObjectStore:
        #destinationPath: "$s3_destination_path"
        #endpointURL: ${endpoint}
        destinationPath: "$s3_destination_path"
        endpointURL: "$s3_endpoint_url"
        s3Credentials:
          accessKeyId:
            name: minio-creds
            key: ACCESS_KEY_ID
          secretAccessKey:
            name: minio-creds
            key: ACCESS_SECRET_KEY
EOF
if [[ "$object_storage_type" = "aws" ]]; then
  cat >> ./pitr/restore.yaml <<EOF
          sessionToken:
            name: minio-creds
            key: ACCESS_SESSION_TOKEN
EOF
fi

print_info "Deleting cluster-restore cluster\n"
${kubectl_cmd} delete cluster ${cluster_restore}
sleep 5
${kubectl_cmd} exec -it ${primary} -- psql -U postgres -c "select pg_switch_wal();"
#${kubectl_cmd} apply -f ./pitr/restore.yaml
envsubst < ./pitr/restore.yaml | ${kubectl_cmd} apply -n ${namespace} -f-

print_info "/!\ Verify that only the first record will be restored in the new cluster${reset}\n"
print_info "/!\ Please, wait 60 seconds\n"
printf "\n"
sleep 70
${kubectl_cmd} exec -it ${cluster_restore}-1 -- psql -U postgres -c "select * from test;"

