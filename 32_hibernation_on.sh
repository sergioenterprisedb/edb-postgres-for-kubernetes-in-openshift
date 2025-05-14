#!/bin/bash
. ./config.sh

#Doc
echo "32" > ./docs/docid

print_command "${kubectl_cnp} hibernate on ${cluster_name}\n"

${kubectl_cnp} hibernate on ${cluster_name}

