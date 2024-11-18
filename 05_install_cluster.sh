#!/bin/bash

. ./config.sh
. ./env.sh
. ./create_namespace.sh

printf "${green}${kubectl_cmd} apply -n ${namespace} -f ./yaml/${cluster_name}.yaml${reset}\n"

${kubectl_cmd} apply -n ${namespace} -f ./yaml/${cluster_name}.yaml
