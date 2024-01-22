#!/bin/bash

kubectl delete -f pgadmin-deployment.yaml
kubectl delete -f pgadmin-service.yaml
kubectl delete -f route.yaml

