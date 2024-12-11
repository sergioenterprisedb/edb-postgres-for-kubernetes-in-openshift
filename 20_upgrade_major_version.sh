#!/bin/bash

. ./config.sh

print_command "${kubectl_cmd} apply -f cluster-sample-upgrade-16-to-17.yaml\n"

envsubst < ./yaml/cluster-sample-upgrade-16-to-17.yaml | ${kubectl_cmd} apply -n ${namespace} -f-
