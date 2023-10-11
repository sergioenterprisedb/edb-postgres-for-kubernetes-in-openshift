#!/bin/bash

. ./config.sh

printf "${green}${kubectl_cmd} apply -f ./yaml/${cluster_name}.yaml${reset}\n"

${kubectl_cmd} create secret generic -o yaml tde-key \
    --from-literal=key=PostgresRocks

${kubectl_cmd} apply -f ./yaml/${cluster_name}-tde.yaml
