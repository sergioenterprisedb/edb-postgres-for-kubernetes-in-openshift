
export POSTGRES_HOST=$(oc get svc cluster-sample-rw -o=jsonpath='{.spec.clusterIP}')
export POSTGRES_PORT=$(oc get svc cluster-sample-rw -o=jsonpath='{.spec.ports[0].port}')

kubectl apply -f pgadmin-deployment.yaml
kubectl apply -f pgadmin-service.yaml
kubectl apply -f route.yaml

echo "**********************************************************************"
echo "Connect to: http://pgadmin-client-openshift-operators.apps-crc.testing"
echo "User: test@test.com"
echo "Password: test"
echo "**********************************************************************"

