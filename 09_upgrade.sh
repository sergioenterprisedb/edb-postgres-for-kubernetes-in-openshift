#!/bin/bash

. ./config.sh
. ./env.sh

#Doc
echo "09" > ./docs/docid

if [ "$object_storage_type" == "aws" ]; then
  print_command "${kubectl_cmd} apply -n ${namespace} -f ./yaml/cluster-sample-upgrade.yaml\n"
  envsubst <  ./yaml/cluster-sample-upgrade.yaml | ${kubectl_cmd} apply -n ${namespace} -f-
elif [ "$object_storage_type" == "minio" ]; then
  print_command "${kubectl_cmd} apply -n ${namespace} -f ./yaml/cluster-sample-upgrade-minio.yaml\n"
  envsubst <  ./yaml/cluster-sample-upgrade-minio.yaml | ${kubectl_cmd} apply -n ${namespace} -f-
fi
