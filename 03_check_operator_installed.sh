#!/bin/bash
. ./config.sh

printf "${green}${kubectl_cmd} get deploy -A | grep postgres${version2}${reset}\n"

${kubectl_cmd} get deploy -A | grep -E "postgres|NAMESPACE"


