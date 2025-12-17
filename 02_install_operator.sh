#!/bin/bash

. ./config.sh

# EDB Token

if [[ -z "${EDB_SUBSCRIPTION_TOKEN}" ]]; then
  echo ""
  echo "Warning:"
  echo "********"
  echo "EDB_SUBSCRIPTION_TOKEN is not set."
  echo "Please, create file .credentials.sh with this value:"
  echo "export EDB_SUBSCRIPTION_TOKEN=\"<your-token>\" > .credentials.sh"
  echo ""
  exit 1
else
  . ./install_edb_token.sh
fi

print_command "oc get packagemanifests -n openshift-marketplace cloud-native-postgresql\n"
${kubectl_cmd} get packagemanifests -n openshift-marketplace cloud-native-postgresql
sleep 1

print_command "oc describe packagemanifests -n openshift-marketplace cloud-native-postgresql\n"
${kubectl_cmd} describe packagemanifests -n openshift-marketplace cloud-native-postgresql
sleep 1

# Cluster-wide installation
print_command "oc apply -f ./yaml/operator-subscription.yaml\n"
${kubectl_cmd} apply -f ./yaml/operator-subscription.yaml

