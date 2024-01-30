#!/bin/bash
. ../config.sh
printf "${green}kubectl apply -f route_monitoring.yaml${reset}\n"
printf "\n"

kubectl apply -f route_monitoring.yaml

