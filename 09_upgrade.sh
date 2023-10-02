#!/bin/bash
. ./config.sh
printf "${green}kubectl apply -f ./yaml/${cluster_name}-upgrade.yaml${reset}\n"

kubectl apply -f ./yaml/${cluster_name}-upgrade.yaml
