#!/bin/bash
. ./config.sh

print_command "${kubectl_cmd} get deploy -A | grep postgres${version2}\n"

${kubectl_cmd} get deploy -A | grep -E "postgres|NAMESPACE"


