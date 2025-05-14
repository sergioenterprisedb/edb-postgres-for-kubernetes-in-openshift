#!/bin/bash
. ./config.sh

#Doc
echo "03" > ./docs/docid

print_command "${kubectl_cmd} get deploy -A | grep postgres${version2}\n"

${kubectl_cmd} get deploy -A | grep -E "postgres|NAMESPACE"


