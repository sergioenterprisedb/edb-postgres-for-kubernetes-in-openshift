#!/bin/bash
. ./config.sh
print_command "${kubectl_cmd} delete -f ./yaml/backup.yaml\n"
${kubectl_cmd} delete -f ./yaml/backup.yaml
sleep 3
print_command "${kubectl_cmd} apply -f ./yaml/backup.yaml\n"
envsubst < ./yaml/backup.yaml | ${kubectl_cmd} apply -n ${namespace} -f-

