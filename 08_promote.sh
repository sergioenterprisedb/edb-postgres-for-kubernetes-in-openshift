#!/bin/bash
. ./config.sh
print_command "${kubectl_cnp} promote ${cluster_name} ${cluster_name}-2\n"

${kubectl_cnp} promote -n ${namespace} ${cluster_name} ${cluster_name}-2
