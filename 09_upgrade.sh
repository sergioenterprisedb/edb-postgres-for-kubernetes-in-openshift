#!/bin/bash

. ./config.sh
. ./env.sh

# Create secrets AWS
. ./aws_secrets.sh

print_command "${kubectl_cmd} apply -n ${namespace} -f ./yaml/cluster-sample-upgrade.yaml\n"

#${kubectl_cmd} apply -n ${namespace} -f ./yaml/${cluster_name}-upgrade.yaml
envsubst <  ./yaml/cluster-sample-upgrade.yaml | ${kubectl_cmd} apply -n ${namespace} -f-
