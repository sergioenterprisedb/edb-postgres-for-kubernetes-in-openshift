#!/bin/bash

cd ..
. ./config.sh
cd -

. ./config.sh

for ((i=1; i<=$users; i++)); do
  id="user${i}"
  cluster_name="cluster-user${i}"
  region="emea"
  namespace="edb-${region}-${id}"
  postgres_instances=3

  ${kubectl_cmd} delete secret minio-creds -n ${namespace}
  ${kubectl_cmd} create secret -n ${namespace} generic minio-creds \
    --from-literal=ACCESS_KEY_ID=${ACCESS_KEY_ID} \
    --from-literal=ACCESS_SECRET_KEY=${ACCESS_SECRET_KEY}

  envsubst < cluster-sample.yaml | oc apply -n ${namespace} -f- &
done
