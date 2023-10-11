#!/bin/bash
. ./config.sh
printf "${green}${kubectl_cmd} delete -f ./yaml/backup.yaml${reset}\n"
${kubectl_cmd} delete -f ./yaml/backup.yaml
sleep 3
printf "${green}${kubectl_cmd} apply -f ./yaml/backup.yaml${reset}\n"
${kubectl_cmd} apply -f ./yaml/backup.yaml
