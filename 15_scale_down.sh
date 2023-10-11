#!/bin/bash
. ./config.sh
printf "${green}${kubectl_cmd} scale cluster ${cluster_name} --replicas=2${reset}\n"

${kubectl_cmd} scale cluster ${cluster_name} --replicas=2

