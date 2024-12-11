#!/bin/bash

. ./config.sh

print_command "${kubectl_cmd} config set-context --current --namespace=${namespace}\n"

${kubectl_cmd} config set-context --current --namespace=${namespace}
