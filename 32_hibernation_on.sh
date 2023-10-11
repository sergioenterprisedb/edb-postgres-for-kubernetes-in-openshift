#!/bin/bash
. ./config.sh
printf "${green}${kubectl_cnp} hibernate on cluster-sample${reset}\n"

${kubectl_cnp} hibernate on cluster-sample

