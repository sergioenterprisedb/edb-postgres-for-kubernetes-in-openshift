#!/bin/bash

kubectl apply -f pgadmin-configmap.yaml
kubectl apply -f pgadmin-deployment.yaml
kubectl apply -f pgadmin-service.yaml
kubectl apply -f route.yaml

echo "**********************************************************************"
echo "Connect to: http://pgadmin-client-openshift-operators.apps-crc.testing"
echo "User: test@test.com"
echo "Password: test"
echo "**********************************************************************"

