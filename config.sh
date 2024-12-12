#!/bin/bash

. ./commands.sh

# Kubernetes environment
export kubectl_cmd="oc"
export kubectl_cnp="kubectl-cnp"

# Template: edb-<region>-<your-first-name>
# Ex:       edb-emea-user1
export namespace="edb-<region>-<name>"

# Postgres

# Templace: "cluster-<name>"
# Ex: .     cluster-user1
export cluster_name="cluster-<name>"

export postgres_instances=3
export postgres_cpu="0.5"
export postgres_memory="512Mi"
export postgres_storage="512Mi"
export postgres_wal_storage="512Mi"
export postgres_default_image="quay.io/enterprisedb/postgresql:16.1"
export postgres_upgrade_image="quay.io/enterprisedb/postgresql:16.4"
export postgres_17_image="quay.io/enterprisedb/postgresql:17"

# S3
# --
# Object storage environment [aws]
export object_storage_type="aws"
export object_storage_bucket="sergio1-bucket"
# aws
export s3_destination_path="s3://sergio1-bucket/"
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

