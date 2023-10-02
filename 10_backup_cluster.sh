#!/bin/bash
. ./config.sh
printf "${green}kubectl delete -f ./yaml/backup.yaml${reset}\n"
kubectl delete -f ./yaml/backup.yaml

printf "${green}kubectl apply -f ./yaml/backup.yaml${reset}\n"
kubectl apply -f ./yaml/backup.yaml
