#!/bin/bash

cd ..
. ./config.sh
cd -

kubectl delete cluster ${cluster_name}-tde
kubectl delete secret tde-key
kubectl delete configmaps -n openshift-operators postgresql-operator-controller-manager-config
