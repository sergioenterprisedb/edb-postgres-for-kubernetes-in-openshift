#!/bin/bash

. ./config.sh

printf "${green}${kubectl_cmd} apply -f ./yaml/${cluster_name}.yaml${reset}\n"

${kubectl_cmd} apply -f ./yaml/${cluster_name}.yaml
