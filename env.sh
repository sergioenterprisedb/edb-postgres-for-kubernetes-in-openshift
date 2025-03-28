#!/bin/bash

. ./config.sh
. ./commands.sh

k8s_context_name=`${kubectl_cmd} config get-contexts | grep "*" | awk '{print $2}'`
k8s_context_cluster=`${kubectl_cmd} config get-contexts | grep "*" | awk '{print $3}'`
k8s_context_namespace=`${kubectl_cmd} config get-contexts | grep "*" | awk '{print $5}'`
k8s_cpu_pods_count=`count_cpu_pods`
k8s_cpu_nodes_count=`count_cpu_nodes`
k8s_nodes_count=$(total_nodes)

# If total pod cpus is greater than node cpus
if (( $(echo "$k8s_cpu_pods_count < $k8s_cpu_nodes_count" | bc -l) )); then
  k8s_cpu_pods_count_label="${green}${k8s_cpu_pods_count}"
else
  k8s_cpu_count_label="${red}${k8s_cpu_count}"
fi

if [[ "$k8s_context_namespace" != "$namespace" ]]; then
  print_error "===================================================================================\n"
  print_error " Kubernetes current context namespace is not the same that demo namespace.\n"
  print_error "\n"
  print_error " ├ Context current namespace : ${yellow}${k8s_context_namespace}\n"
  print_error " └ Demo Namespace            : ${yellow}${namespace}\n"
  print_error "\n"
  print_error " ${underline}Description of the problem:${reset}\n"
  print_error "\n"
  print_error " ├ Your default Kubernetes context namespace is different of your test namesapace.\n"
  print_error " ├ Please, before to continue, change it to match both namespace names.\n"
  print_error " └ You can use the command ./set_context.sh\n"
  print_error "==================================================================================\n"
  exit 1
fi

#print_info "================================================================================================\n"
print_info "----------------------------------------------------------------------------------------------\n"
print_info "⎈ Kubernetes environment ⎈\n"
print_info "----------------------------------------------------------------------------------------------\n"
print_info "Context\n"
print_info "├─ Current name            : ${yellow}${k8s_context_name}\n"
print_info "├─ Current cluster         : ${yellow}${k8s_context_cluster}\n"
print_info "└─ Current namespace       : ${yellow}${k8s_context_namespace}\n"
print_info "Pods\n"
print_info "└─ Sum of pod CPU's        : ${k8s_cpu_pods_count_label} / ${k8s_cpu_nodes_count}\n"
print_info "Nodes\n"
print_info "├─ Total K8s nodes         : ${yellow}${k8s_nodes_count}\n"
print_info "└─ Number of CPU's per node: ${yellow}${k8s_cpu_nodes_count}\n"
print_info "Kubernetes Namespace       : ${yellow}${namespace}\n"

print_info "\n"
print_info "----------------------------------------------------------------------------------------------\n"
print_info "PostgreSQL Cluster configuration\n"
print_info "----------------------------------------------------------------------------------------------\n"
print_info "PostgreSQL Cluster Name    : ${yellow}${cluster_name}\n"
print_info "Postgres Instances         : ${yellow}${postgres_instances}\n"
print_info "Postgres CPU's             : ${yellow}${postgres_cpu}\n"
print_info "Postgres Memory            : ${yellow}${postgres_memory}\n"
print_info "Postgres storage           : ${yellow}${postgres_storage}\n"
print_info "Postgres WAL storage       : ${yellow}${postgres_wal_storage}\n"
print_info "\n"
print_info "----------------------------------------------------------------------------------------------\n"
print_info "Object Storage\n"
print_info "----------------------------------------------------------------------------------------------\n"
print_info "Object Storage type        : ${yellow}${object_storage_type}\n"
print_info "Object Storage bucket      : ${yellow}${object_storage_bucket}\n"
print_info "Destination path           : ${yellow}${s3_destination_path}\n"
print_info "Endpoint                   : ${yellow}${s3_endpoint_url}\n"
print_info "\n"
print_info "----------------------------------------------------------------------------------------------\n"
print_info "Transparent Data Encryption (TDE)\n"
print_info "----------------------------------------------------------------------------------------------\n"
print_info "Using TDE (in progress)    : ${yellow}${use_tde}\n"
print_info "\n"
#print_info "================================================================================================\n"
print_info ""

