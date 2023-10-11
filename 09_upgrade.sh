#!/bin/bash
. ./config.sh
printf "${green}${kubectl_cnp} apply -f ./yaml/${cluster_name}-upgrade.yaml${reset}\n"

${kubectl_cmd} apply -f ./yaml/${cluster_name}-upgrade.yaml
