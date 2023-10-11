#!/bin/bash
. ./config.sh
printf "${green}${kubectl_cmd} scale cluster i${cluster_name} --replicas=4${reset}\n"

${kubectl_cmd} scale cluster ${cluster_name} --replicas=4

