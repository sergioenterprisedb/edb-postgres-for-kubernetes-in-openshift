#!/bin/bash

. ./config.sh

printf "${green}${kubectl_cmd} apply -f ./yaml/cluster-example-upgrade-13-to-15.yaml${reset}\n"

${kubectl_cmd} apply -f ./yaml/cluster-example-upgrade-13-to-15.yaml
