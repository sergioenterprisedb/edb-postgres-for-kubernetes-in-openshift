#!/bin/bash
. ../config.sh

${kubectl_cmd} delete -f tenant.yaml
${kubectl_cmd} delete -f storage-configuration.yaml
${kubectl_cmd} delete -f storage-user.yaml
${kubectl_cmd} delete -f minio_route.yaml
${kubectl_cmd} delete -f minio_client_route.yaml
${kubectl_cmd} delete -f backup-secrets.yaml
${kubectl_cmd} delete -f subscription.yaml
${kubectl_cmd} delete namespace minio-tenant
${kubectl_cmd} delete namespace minio-operator

