#!/bin/bash

. ./config.sh

printf "${green}kubectl apply -f ./yaml/cluster-example-upgrade-13-to-15.yaml${reset}\n"

kubectl apply -f ./yaml/cluster-example-upgrade-13-to-15.yaml
