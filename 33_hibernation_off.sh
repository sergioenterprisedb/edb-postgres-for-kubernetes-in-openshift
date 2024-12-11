#!/bin/bash
. ./config.sh
print_command "${kubectl_cnp} hibernate off ${cluster_name}\n"

${kubectl_cnp} hibernate off ${cluster_name}

