#!/bin/bash

. ./config.sh

${kubectl_cmd} delete cluster.postgresql.k8s.enterprisedb.io ${cluster_name}
${kubectl_cmd} delete cluster.postgresql.k8s.enterprisedb.io ${cluster_restore}
${kubectl_cmd} delete namespace ${namespace}

print_info "======================================================\n"
print_info "Your demo environment has been deleted.\n"
print_info "Namespace: $namespace\n"
print_info "Clusters: ${cluster_name} and ${cluster_restore}\n"
print_info "======================================================\n"
