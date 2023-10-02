#!/bin/bash

. ./config.sh

printf "${green}kubectl apply -f ./yaml/cluster-example-13.yaml${reset}\n"

kubectl apply -f ./yaml/cluster-example-13.yaml
