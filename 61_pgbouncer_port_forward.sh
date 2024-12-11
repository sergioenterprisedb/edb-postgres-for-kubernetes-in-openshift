#!/bin/bash

. ./config.sh

print_command "${kubectl_cmd} port-forward service/pooler-${cluster_name}-rw  6432:5432 &\n"
${kubectl_cmd} port-forward service/pooler-${cluster_name}-rw  6432:5432 &
pid1=$!
print_info "Port forward process ID: ${red}${pid1}\n"

