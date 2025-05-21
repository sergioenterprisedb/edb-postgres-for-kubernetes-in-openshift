#!/bin/bash
. ./config.sh

#Doc
echo "11" > ./docs/docid

${kubectl_cmd} describe backup ${cluster_name}-backup-test
print_command "${kubectl_cmd} describe backup ${cluster_name}-backup-test\n"
