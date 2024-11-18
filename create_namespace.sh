#!/bin/bash

. ./config.sh

printf "${green}${kubectl_cmd}get namespace ${namespace} || ${kubectl_cmd} create namespace ${namespace}${reset}\n"
${kubectl_cmd} get namespace ${namespace} || ${kubectl_cmd} create namespace ${namespace}
