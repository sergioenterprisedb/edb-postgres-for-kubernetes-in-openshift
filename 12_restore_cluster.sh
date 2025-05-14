#!/bin/bash
. ./config.sh

#Doc
echo "12" > ./docs/docid

print_command "echo \"select pg_switch_wal()\" | ${kubectl_cnp} psql ${cluster_name}  -- -U postgres\n"
print_command "${kubectl_cmd} apply -f ./yaml/restore.yaml\n"

print_command "echo \"select pg_switch_wal()\" | ${kubectl_cnp} psql ${cluster_name} -- -U postgres\n"
sleep 3
envsubst < ./yaml/restore.yaml | ${kubectl_cmd} apply -n ${namespace} -f-

