#!/bin/bash

. ./config.sh

export PGPASSWORD=$(kubectl get secret -n ${namespace} cluster-sample-superuser -o jsonpath="{.data.password}" | base64 --decode)

server=`kubectl get svc | grep LoadBalancer | awk '{print $4}'`

print_info "\n"
print_info "Database Server  : ${yellow}${server}\n"
print_info "Database Password: ${yellow}$PGPASSWORD\n"
print_info "\n"

