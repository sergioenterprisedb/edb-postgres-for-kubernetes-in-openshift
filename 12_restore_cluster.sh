#!/bin/bash
. ./config.sh
print_command "echo \"select pg_switch_wal()\" | ${kubectl_cnp} psql cluster-sample -- -U postgres\n"
print_command "${kubectl_cmd} apply -f ./yaml/restore.yaml\n"

print_command "select pg_switch_wal()" | ${kubectl_cnp} psql ${cluster_name} -- -U postgres
sleep 3
envsubst < ./yaml/restore.yaml | ${kubectl_cmd} apply -n ${namespace} -f-

