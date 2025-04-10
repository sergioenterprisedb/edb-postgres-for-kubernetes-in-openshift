#!/bin/bash

. ./commands.sh

# Variables to be replaced
export id="<your_user>"           # your name or id
export region="emea"              # emea,na,apj
export bucket="<your_bucket>"     # S3 bucket name

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
export postgres_default_image="quay.io/enterprisedb/postgresql:16.2"
export postgres_upgrade_image="quay.io/enterprisedb/postgresql:16.4"
export postgres_17_image="quay.io/enterprisedb/postgresql:17"

# EPAS
export epas_image="docker.enterprisedb.com/k8s_enterprise/edb-postgres-advanced:17.2"
export epas_storage="512Mi"

# Object Storage environment [minio|aws]
export object_storage_type="minio"
export ACCESS_KEY_ID=""
export ACCESS_SECRET_KEY=""
export ACCESS_SESSION_TOKEN=""

## S3
#export object_storage_type="aws"
#export object_storage_bucket="${bucket}"
#export s3_destination_path="s3://${bucket}/"

## Minio
export object_storage_bucket="${bucket}"
export s3_destination_path="s3://${bucket}/"
export s3_endpoint_url="<your_end_point>"

# TDE used
# Not yet implemented
export use_tde="N" # Y|N

