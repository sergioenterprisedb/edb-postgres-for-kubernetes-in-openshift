#!/bin/bash
. ./config.sh
printf "${green}echo \"select pg_switch_wal()\" | ${kubectl_cnp} psql cluster-sample${reset}\n"
printf "${green}${kubectl_cmd} apply -f ./yaml/restore.yaml${reset}\n"

echo "select pg_switch_wal()" | ${kubectl_cnp} psql ${cluster_name} -- -U postgres
sleep 3
${kubectl_cmd} apply -f ./yaml/restore.yaml

