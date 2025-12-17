#!/bin/bash

cd ..
. ./config.sh
cd -

print_command "envsubst < ../yaml/cluster-tde.yaml | ${kubectl_cmd} apply -n ${namespace} -f-\n"

envsubst < ../yaml/cluster-tde.yaml | ${kubectl_cmd} apply -n ${namespace} -f-

