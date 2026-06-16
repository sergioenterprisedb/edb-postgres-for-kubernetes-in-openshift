#!/bin/bash
. ./config.sh

#Doc
echo "15" > ./docs/docid

print_command "${kubectl_cmd} scale cluster.postgresql.k8s.enterprisedb.io ${cluster_name} --replicas=2\n"

${kubectl_cmd} scale cluster.postgresql.k8s.enterprisedb.io ${cluster_name} --replicas=2

