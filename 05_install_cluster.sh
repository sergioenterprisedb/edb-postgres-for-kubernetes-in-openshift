#!/bin/bash

. ./config.sh

printf "${green}kubectl apply -f ./yaml/${cluster_name}.yaml${reset}\n"

oc apply -f ./yaml/${cluster_name}.yaml
