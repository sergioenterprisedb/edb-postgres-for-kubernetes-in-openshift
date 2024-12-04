#!/bin/bash

. ./config.sh

printf "${green}${kubectl_cmd} apply -f ${cluster_name}-upgrade-16-to-17.yaml${reset}\n"

${kubectl_cmd} apply -f yaml/${cluster_name}-upgrade-16-to-17.yaml
