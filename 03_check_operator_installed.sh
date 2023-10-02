#!/bin/bash
. ./config.sh

printf "${green}kubectl get deploy -A | grep postgres${version2}${reset}\n"

kubectl get deploy -A | grep -E "postgres|NAMESPACE"


