#!/bin/bash

. ./config.sh

printf "${green}${kubectl_cmd} apply -f ./yaml/cluster-example-13.yaml${reset}\n"

${kubectl_cmd} apply -f ./yaml/cluster-example-13.yaml
