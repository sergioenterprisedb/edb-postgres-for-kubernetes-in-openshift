#!/bin/bash
. ./config.sh

#Doc
echo "10" > ./docs/docid

print_command "${kubectl_cmd} delete -f ./yaml/backup.yaml\n"
envsubst < ./yaml/backup.yaml | ${kubectl_cmd} delete -n ${namespace} -f-

print_command "${kubectl_cmd} apply -f ./yaml/backup.yaml\n"
envsubst < ./yaml/backup.yaml | ${kubectl_cmd} apply -n ${namespace} -f-

print_command "echo \"select pg_switch_wal()\" | ${kubectl_cnp} psql ${cluster_name} -- -U postgres\n"
echo "select pg_switch_wal()" | ${kubectl_cnp} psql ${cluster_name} -- -U postgres

