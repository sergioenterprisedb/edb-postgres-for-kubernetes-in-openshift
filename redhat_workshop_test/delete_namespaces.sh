#!/bin/bash

. ./config.sh

for ((i=1; i<=$users; i++)); do
  id="user${i}"
  cluster_name="cluster-user${i}"
  region="emea"
  namespace="edb-${region}-${id}"

  # Delete minio creds
  oc delete secret minio-creds -n ${namespace}

  echo "Deleting namespace ${namespace}"
  oc delete namespace ${namespace} &
done
