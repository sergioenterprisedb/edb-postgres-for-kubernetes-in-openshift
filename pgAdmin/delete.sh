#!/bin/bash

kubectl delete -f pgadmin-configmap.yaml
kubectl delete -f pgadmin-deployment.yaml
kubectl delete -f pgadmin-service.yaml
kubectl delete -f route.yaml

kubectl delete -f security-context.yaml
kubectl delete sa sa-pga
kubectl delete -f rbca.yaml

