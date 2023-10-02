#!/bin/bash

. ./config.sh

printf "${green}kubectl apply -f ./yaml/${cluster_name}.yaml${reset}\n"

kubectl create secret generic -o yaml tde-key \
    --from-literal=key=PostgresRocks

oc apply -f ./yaml/${cluster_name}-tde.yaml
