#!/bin/bash
. ./config.sh

#Doc
echo "15" > ./docs/docid

print_command "${kubectl_cmd} scale cluster ${cluster_name} --replicas=2\n"

${kubectl_cmd} scale cluster ${cluster_name} --replicas=2

