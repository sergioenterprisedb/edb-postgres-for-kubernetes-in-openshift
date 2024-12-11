#!/bin/bash

. ./config.sh
print_command "oc get packagemanifests -n openshift-marketplace cloud-native-postgresql\n"
${kubectl_cmd} get packagemanifests -n openshift-marketplace cloud-native-postgresql
sleep 1

print_command "oc describe packagemanifests -n openshift-marketplace cloud-native-postgresql\n"
${kubectl_cmd} describe packagemanifests -n openshift-marketplace cloud-native-postgresql
sleep 1

# Cluster-wide installation
print_command "oc apply -f ./yaml/operator-subscription.yaml\n"
${kubectl_cmd} apply -f ./yaml/operator-subscription.yaml

