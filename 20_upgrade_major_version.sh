#!/bin/bash

. ./config.sh

print_command "${kubectl_cmd} apply -f ${cluster_name}-upgrade-16-to-17.yaml\n"

#${kubectl_cmd} apply -f yaml/${cluster_name}-upgrade-16-to-17.yaml
envsubst < ./yaml/${cluster_name}-upgrade-16-to-17.yaml | ${kubectl_cmd} apply -n ${namespace} -f-
