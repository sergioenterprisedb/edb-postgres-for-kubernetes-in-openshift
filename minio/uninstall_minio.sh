#!/bin/bash
. ../config.sh

${kubectl_cnp} delete -f tenant.yaml
${kubectl_cnp} delete -f storage-configuration.yaml
${kubectl_cnp} delete -f storage-user.yaml
${kubectl_cnp} delete -f minio_route.yaml
${kubectl_cnp} delete -f minio_client_route.yaml
${kubectl_cnp} delete -f backup-secrets.yaml
${kubectl_cnp} delete -f subscription.yaml
${kubectl_cnp} delete namespace minio-tenant

