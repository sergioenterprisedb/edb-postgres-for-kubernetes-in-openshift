#!/bin/bash

. ./commands.sh

# Variables to be replaced
export id="sergio"                       # your name or id
export region="emea"                     # emea,na,apj
export bucket="sergio1-bucket"           # S3 bucket name

# Kubernetes environment
export namespace="edb-${region}-${id}"   # k8s namespace
export kubectl_cmd="oc"
export kubectl_cnp="kubectl-cnp"

# Postgres
export cluster_name="cluster-${id}"
export cluster_restore="cluster-restore-${id}"
export postgres_instances=3
export postgres_cpu="0.5"
export postgres_memory="512Mi"
export postgres_storage="512Mi"
export postgres_wal_storage="512Mi"
export postgres_default_image="quay.io/enterprisedb/postgresql:16.1"
export postgres_upgrade_image="quay.io/enterprisedb/postgresql:16.4"
export postgres_17_image="quay.io/enterprisedb/postgresql:17"

# EPAS
export epas_image="docker.enterprisedb.com/k8s_enterprise/edb-postgres-advanced:17.2"
export epas_storage="512Mi"

# S3
# Object storage environment [aws]
export object_storage_type="aws"
export object_storage_bucket="${bucket}"

# aws
export s3_destination_path="s3://${bucket}/"
export s3_endpoint_url=""

# Minio
#export s3_destination_path="s3://database-backups/"
#export s3_endpoint_url="http://minio-client-minio-operator.apps-crc.testing"

# Minio local
#export s3_destination_path="s3://database-backups/"
#s3_endpoint_url="http://172.17.0.2:9000"

# TDE used
# Not yet implemented
export use_tde="N" # Y|N

