#!/bin/bash
. ./.credentials.sh

# OpenShift
oc delete secret -n openshift-operators postgresql-operator-pull-secret
oc create secret docker-registry postgresql-operator-pull-secret \
  -n openshift-operators \
  --docker-server=docker.enterprisedb.com \
  --docker-username=k8s \
  --docker-password="${EDB_SUBSCRIPTION_TOKEN}"

docker login docker.enterprisedb.com  \
  --username k8s \
  --password "${EDB_SUBSCRIPTION_TOKEN}"
  