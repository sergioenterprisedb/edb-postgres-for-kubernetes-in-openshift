#!/bin/bash

. ./config.sh

printf "${green}${kubectl_cmd} port-forward service/pooler-sample-rw  6432:5432 &${reset}\n"
${kubectl_cmd} port-forward service/pooler-sample-rw  6432:5432 &
pid1=$!
printf "${green}Port forward process ID: ${red}${pid1}${reset}\n"

