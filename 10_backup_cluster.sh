#!/bin/bash
. ./config.sh
print_command "${kubectl_cmd} delete -f ./yaml/backup.yaml\n"
${kubectl_cmd} delete -f ./yaml/backup.yaml

printf "${kubectl_cmd} apply -f ./yaml/backup.yaml\n"
#${kubectl_cmd} apply -f ./yaml/backup.yaml
envsubst < ./yaml/backup.yaml | ${kubectl_cmd} apply -n ${namespace} -f-

printf "echo \"select pg_switch_wal()\" | ${kubectl_cnp} psql cluster-sample -- -U postgres\n"
echo "select pg_switch_wal()" | ${kubectl_cnp} psql ${cluster_name} -- -U postgres

