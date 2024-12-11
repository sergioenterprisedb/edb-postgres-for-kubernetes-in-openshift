#!/bin/bash

. ./config.sh

print_command "${kubectl_cmd} create namespace ${namespace}\n"

if ${kubectl_cmd} get namespace "$namespace" >/dev/null 2>&1; then
  echo "Namespace '$namespace' already exists."
else
  echo "Namespace '${namespace}' does not exist. Creating it..."
  ${kubectl_cmd} create namespace ${namespace}
  echo "Namespace '${namespace}' created successfully."
fi
