#!/bin/bash
. ./config.sh
printf "${green}${kubectl_cnp} hibernate off cluster-sample${reset}\n"

${kubectl_cnp} hibernate off cluster-sample

