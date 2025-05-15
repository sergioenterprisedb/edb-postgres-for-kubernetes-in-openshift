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

  kubectl-cnp -n ${namespace} backup ${cluster_name} &
done
