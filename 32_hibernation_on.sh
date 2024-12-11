#!/bin/bash
. ./config.sh
print_command "${kubectl_cnp} hibernate on ${cluster_name}\n"

${kubectl_cnp} hibernate on ${cluster_name}

