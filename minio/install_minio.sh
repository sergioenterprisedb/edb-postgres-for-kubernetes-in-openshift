#!/bin/bash

kubectl create secret generic backup-secret \
  --from-literal=ACCESS_KEY_ID=minio \
  --from-literal=ACCESS_SECRET_KEY=minio123

kubectl create namespace minio-tenant

kubectl apply -f subscription.yaml
sleep 3
kubectl apply -f tenant.yaml
sleep 3
kubectl apply -f storage-configuration.yaml
kubectl apply -f storage-user.yaml
sleep 3

kubectl apply -f minio_route.yaml
kubectl apply -f minio_client_route.yaml
kubectl apply -f backup-secrets.yaml
