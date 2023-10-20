#!/bin/bash
. ./config.sh
printf "${green}${kubectl_cmd} delete -f ./yaml/backup.yaml${reset}\n"
${kubectl_cmd} delete -f ./yaml/backup.yaml

printf "${green}${kubectl_cmd} apply -f ./yaml/backup.yaml${reset}\n"
${kubectl_cmd} apply -f ./yaml/backup.yaml

printf "${green}echo \"select pg_switch_wal()\" | ${kubectl_cnp} psql cluster-sample -- -U postgres${reset}\n"
echo "select pg_switch_wal()" | ${kubectl_cnp} psql ${cluster_name} -- -U postgres

