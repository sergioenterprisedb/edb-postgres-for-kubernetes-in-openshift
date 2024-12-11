#!/bin/bash
. ./config.sh
print_command "${kubectl_cmd} scale cluster ${cluster_name} --replicas=4\n"

${kubectl_cmd} scale cluster ${cluster_name} --replicas=4

