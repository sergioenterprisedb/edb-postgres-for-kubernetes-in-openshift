#!/bin/bash

# https://github.com/sergioenterprisedb/edb-postgres-for-kubernetes-in-openshift/tree/main/pgAdmin
oc adm policy add-scc-to-group anyuid system:serviceaccounts:openshift-operators
# Create custom security context constraints
oc apply -f security-context.yaml
# Create a new service account for the deployment, use the following command
oc create sa sa-pga
# Setup a role and role binding to use SCC and service account. Please use the following resource yaml.
oc apply -f rbca.yaml


oc apply -f pgadmin-configmap.yaml
oc apply -f pgadmin-deployment.yaml
oc apply -f pgadmin-service.yaml
oc apply -f route.yaml

echo "**********************************************************************"
echo "Connect to: http://pgadmin-client-openshift-operators.apps-crc.testing"
echo "User: test@test.com"
echo "Password: test"
echo "Database password: `./password_app.sh`"
echo "**********************************************************************"

