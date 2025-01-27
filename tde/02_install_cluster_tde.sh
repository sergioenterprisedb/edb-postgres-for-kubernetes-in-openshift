#!/bin/bash

cd ..
. ./config.sh
cd -

print_command "envsubst < ../yaml/cluster-tde.yaml | ${kubectl_cmd} apply -n ${namespace} -f-\n"

#${kubectl_cmd} apply -f ./yaml/cluster-tde.yaml
envsubst < ../yaml/cluster-tde.yaml | ${kubectl_cmd} apply -n ${namespace} -f-

