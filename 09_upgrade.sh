#!/bin/bash

. ./config.sh
. ./env.sh

printf "${green}${kubectl_cnp} apply -n ${namespace} -f ./yaml/${cluster_name}-upgrade.yaml${reset}\n"

${kubectl_cmd} apply -n ${namespace} -f ./yaml/${cluster_name}-upgrade.yaml
