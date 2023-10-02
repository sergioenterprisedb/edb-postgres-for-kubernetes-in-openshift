#!/bin/bash

kubectl delete -f tenant.yaml
kubectl delete -f storage-configuration.yaml
kubectl delete -f storage-user.yaml
kubectl delete -f minio_route.yaml
kubectl delete -f minio_client_route.yaml
kubectl delete -f backup-secrets.yaml
kubectl delete -f subscription.yaml
kubectl delete namespace minio-tenant

