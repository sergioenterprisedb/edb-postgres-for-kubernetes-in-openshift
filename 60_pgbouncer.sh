#!/bin/bash
. ./config.sh

#${kubectl_cmd} apply -f ./yaml/pgbouncer.yaml
envsubst < ./yaml/pgbouncer.yaml | ${kubectl_cmd} apply -n ${namespace} -f-
sleep 5

