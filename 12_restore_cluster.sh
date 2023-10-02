#!/bin/bash
. ./config.sh
printf "${green}echo \"select pg_switch_wal()\" | kubectl-cnpg psql cluster-sample${reset}\n"
printf "${green}kubectl apply -f ./yaml/restore.yaml${reset}\n"

echo "select pg_switch_wal()" | kubectl-cnp psql ${cluster_name} -- -U postgres

kubectl apply -f ./yaml/restore.yaml

