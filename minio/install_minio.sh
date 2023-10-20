#!/bin/bash
. ../config.sh

${kubectl_cmd} create secret generic backup-secret \
  --from-literal=ACCESS_KEY_ID=minio \
  --from-literal=ACCESS_SECRET_KEY=minio123

${kubectl_cmd} create namespace minio-tenant
sleep 10
${kubectl_cmd} apply -f subscription.yaml
sleep 90
${kubectl_cmd} get deploy -A | grep -E "minio|NAMESPACE"
sleep 5
${kubectl_cmd} apply -f tenant.yaml
sleep 3
${kubectl_cmd} apply -f storage-configuration.yaml
${kubectl_cmd} apply -f storage-user.yaml
sleep 3

${kubectl_cmd} apply -f minio_route.yaml
${kubectl_cmd} apply -f minio_client_route.yaml
${kubectl_cmd} apply -f backup-secrets.yaml
sleep 20
printf "Console: https://minio-console-minio-tenant.apps-crc.testing/login\n"
printf "User: minio\n"
printf "Password: minio123\n"

