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
  
  echo "Creating user ${cluster_name} in namespace ${namespace}..."
  oc create namespace ${namespace}
done
