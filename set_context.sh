#!/bin/bash

. ./config.sh

print_command "${kubectl_cmd} config set-context --current --namespace=${namespace}"

${kubectl_cmd} config set-context --current --namespace=${namespace}
