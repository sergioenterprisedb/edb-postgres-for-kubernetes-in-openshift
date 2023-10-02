#!/bin/bash
. ./config.sh
printf "${green}kubectl scale cluster i${cluster_name} --replicas=4${reset}\n"

kubectl scale cluster ${cluster_name} --replicas=4

