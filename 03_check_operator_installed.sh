#!/bin/bash
. ./config.sh
. ./commands.sh
#Doc
echo "03" > ./docs/docid

print_command "${kubectl_cmd} get deploy -A | grep postgres${version2}\n"

#${kubectl_cmd} get deploy -A | grep -E "postgres|NAMESPACE"
blue="\033[34m"
reset="\033[0m"

oc get deploy -A | grep postgres | awk \
-v blue="${blue}" -v reset="${reset}" '{
  printf "%s%-14s%s %s\n", blue, "NAMESPACE:", reset, $1
  printf "%s%-14s%s %s\n", blue, "NAME:", reset, $2
  printf "%s%-14s%s %s\n", blue, "READY:", reset, $3
  printf "%s%-14s%s %s\n", blue, "UP-TO-DATE:", reset, $4
  printf "%s%-14s%s %s\n", blue, "AVAILABLE:", reset, $5
  printf "%s%-14s%s %s\n", blue, "AGE:", reset, $6
}'