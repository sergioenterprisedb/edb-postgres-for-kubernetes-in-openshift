#!/bin/bash

. ./config.sh

export PGPASSWORD=$(${kubectl_cmd} get secret -n ${namespace} ${cluster_name}-superuser -o jsonpath="{.data.password}" | base64 --decode)

server=`${kubectl_cmd} get svc | grep LoadBalancer | awk '{print $4}'`

print_info "\n"
print_info "Database Server  : ${yellow}${server}\n"
print_info "Database Password: ${yellow}$PGPASSWORD\n"
print_info "\n"

