#!/bin/bash
. ./config.sh

#Doc
echo "11" > ./docs/docid

${kubectl_cmd} describe backup backup-test
print_command "${kubectl_cmd} describe backup backup-test\n"
