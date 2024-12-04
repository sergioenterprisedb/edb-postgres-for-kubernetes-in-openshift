#!/bin/bash

. ./config.sh

export PGPASSWORD=$(kubectl get secret -n ${namespace} cluster-sample-superuser -o jsonpath="{.data.password}" | base64 --decode)

server=`kubectl get svc | grep LoadBalancer | awk '{print $4}'`

printf "\n"
printf "${green}Database Server  : ${reset}${server}${reset}\n"
printf "${green}Database Password: ${reset}$PGPASSWORD${reset}\n"
printf "\n"

