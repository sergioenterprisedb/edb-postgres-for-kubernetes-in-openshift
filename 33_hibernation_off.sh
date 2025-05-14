#!/bin/bash
. ./config.sh

#Doc
echo "33" > ./docs/docid

print_command "${kubectl_cnp} hibernate off ${cluster_name}\n"

${kubectl_cnp} hibernate off ${cluster_name}

