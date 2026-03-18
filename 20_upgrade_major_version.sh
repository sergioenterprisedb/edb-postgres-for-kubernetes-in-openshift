#!/bin/bash

. ./config.sh

#Doc
echo "20" > ./docs/docid

print_command "${kubectl_cmd} apply -f ${cluster_name}-major-upgrade.yaml\n"

envsubst < ./yaml/cluster-sample-major-upgrade.yaml | ${kubectl_cmd} apply -n ${namespace} -f-
