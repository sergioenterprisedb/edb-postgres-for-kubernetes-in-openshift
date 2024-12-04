#!/bin/bash
. ./config.sh
. ./primary.sh

pitr_date=$(${kubectl_cmd} exec -it ${primary} -- psql -U postgres -X -A -t -c "select min(timestamp+interval '1 second') from test;") 
printf "${yellow}Restore date: ${red}${pitr_date%?}${reset}\n"

cat > ./pitr/restore.yaml <<EOF
apiVersion: postgresql.k8s.enterprisedb.io/v1
kind: Cluster
metadata:
  name: cluster-restore
spec:
  instances: 1
  imageName: 'quay.io/enterprisedb/postgresql:16.4'

  storage:
    size: 1Gi

  bootstrap:
    recovery:
      source: ${cluster_name}
      recoveryTarget:
        targetTime: '${pitr_date%?}'
        #backupID: 20230411T115526

  externalClusters:
    - name: ${cluster_name}
      barmanObjectStore:
        destinationPath: "s3://${object_storage_bucket}/"
        #endpointURL: ""
        ${endpoint}
        s3Credentials:
          accessKeyId:
            name: minio-creds
            key: ACCESS_KEY_ID
          secretAccessKey:
            name: minio-creds
            key: ACCESS_SECRET_KEY
          sessionToken:
            name: minio-creds
            key: ACCESS_SESSION_TOKEN
EOF

printf "${green}Deleting cluster-restore cluster${reset}\n"
${kubectl_cmd} delete cluster cluster-restore
sleep 5
${kubectl_cmd} exec -it ${primary} -- psql -U postgres -c "select pg_switch_wal();"
${kubectl_cmd} apply -f ./pitr/restore.yaml
printf "\n"
printf "${green}/!\ Verify that only the first record will be restored in the new cluster${reset}\n"
printf "${green}/!\ Please, wait 60 seconds${reset}\n"
printf "\n"
sleep 60
${kubectl_cmd} exec -it cluster-restore-1 -- psql -U postgres -c "select * from test;"

