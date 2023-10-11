#!/bin/bash

. ./config.sh
printf "${green}oc get packagemanifests -n openshift-marketplace cloud-native-postgresql${reset}\n"
${kubectl_cmd} get packagemanifests -n openshift-marketplace cloud-native-postgresql
sleep 1

printf "${green}oc describe packagemanifests -n openshift-marketplace cloud-native-postgresql${reset}\n"
${kubectl_cmd} describe packagemanifests -n openshift-marketplace cloud-native-postgresql
sleep 1

#printf "${green}oc create namespace my-operators${reset}\n"
#oc create namespace my-operators
#oc apply -f ./yaml/operator-group.yaml

# Cluster-wide installation
printf "${green}oc apply -f ./yaml/operator-subscription.yaml${reset}\n"
${kubectl_cmd} apply -f ./yaml/operator-subscription.yaml

