#!/bin/bash
. ./config.sh

#Doc
echo "14" > ./docs/docid

print_command "${kubectl_cmd} scale cluster ${cluster_name} --replicas=4\n"

${kubectl_cmd} scale cluster ${cluster_name} --replicas=4

