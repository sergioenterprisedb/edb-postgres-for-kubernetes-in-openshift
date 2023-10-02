#!/bin/bash
. ./config.sh
printf "${green}kubectl scale cluster ${cluster_name} --replicas=2${reset}\n"

kubectl scale cluster ${cluster_name} --replicas=2

