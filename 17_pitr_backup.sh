#!/bin/bash
. ./config.sh

#Doc
echo "17" > ./docs/docid

print_command "${kubectl_cmd} delete backup ${cluster_name}-backup-test\n"
${kubectl_cmd} delete backup ${cluster_name}-backup-test
sleep 3

print_command "${kubectl_cmd} apply -f ./yaml/backup.yaml\n"
envsubst < ./yaml/backup.yaml | ${kubectl_cmd} apply -n ${namespace} -f-
