#!/bin/bash

. ./config.sh

${kubectl_cmd} delete cluster cluster-sample
${kubectl_cmd} delete cluster cluster-restore
${kubectl_cmd} delete namespace ${namespace}

print_info "============================================\n"
print_info "Your demo environment has been deleted.\n"
print_info "Namespace: $namespace\n"
print_info "Clusters: cluster_sample and cluster_restore\n"
print_info "============================================\n"