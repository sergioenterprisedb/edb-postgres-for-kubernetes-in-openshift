#!/bin/bash
. ./config.sh
printf "${green}${kubectl_cnp} promote cluster-sample cluster-sample-2${reset}\n"

${kubectl_cnp} promote ${cluster_name} ${cluster_name}-2
