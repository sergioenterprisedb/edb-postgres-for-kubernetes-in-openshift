#!/bin/bash

#
# Warning: EDB Postgres for Kubernetes images are not compatible with ARM architectures
#

. ./.credentials.sh

# Config map
kubectl create configmap -n openshift-operators \
    postgresql-operator-controller-manager-config \
    --from-literal=EDB_LICENSE_KEY=$EDB_LICENSE_KEY

# Restart
kubectl rollout restart deployment -n openshift-operators \
    postgresql-operator-controller-manager

# Get deployment
kubectl get deployment -n openshift-operators postgresql-operator-controller-manager

