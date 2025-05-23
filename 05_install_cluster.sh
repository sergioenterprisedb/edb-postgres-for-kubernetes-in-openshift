#!/bin/bash

. ./config.sh
. ./env.sh

#Doc
echo "05" > ./docs/docid

if [[ $? -eq 1 ]]; then
    echo "Error occurred. Please fix the problem."
    exit 1
fi

# Create namespace if does not exists
. ./create_namespace.sh

print_command "${kubectl_cmd} apply -n ${namespace} -f ./yaml/cluster_sample.yaml\n"

envsubst < ./yaml/cluster-sample.yaml | ${kubectl_cmd} apply -n ${namespace} -f-

