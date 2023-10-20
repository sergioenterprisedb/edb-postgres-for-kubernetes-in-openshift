#!/bin/bash
. ./config.sh

${kubectl_cmd} apply -f ./yaml/pgbouncer.yaml
sleep 5

