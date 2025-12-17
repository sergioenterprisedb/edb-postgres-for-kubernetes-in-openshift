#!/bin/bash

git_directory=`git rev-parse --show-toplevel`
. ${git_directory}/commands.sh

#. ./commands.sh

# Variables to be replaced
export id="$(oc whoami)"          # your name or id
export region="emea"              # emea,na,apj
export bucket="<your-bucket>"     # S3 bucket name

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

# (Deprecated) Quay.io repository
#export postgres_default_image="quay.io/enterprisedb/postgresql:16.2-multiarch"
#export postgres_upgrade_image="quay.io/enterprisedb/postgresql:16.4-multiarch"

# Using Docker repository

## List version images
## Login skopeo
## skopeo login docker.enterprisedb.com

## Operator
## skopeo list-tags docker://docker.enterprisedb.com/k8s/edb-postgres-for-kubernetes

## EDB Operator
## skopeo list-tags docker://docker.enterprisedb.com/k8s/edb-postgres-for-cloudnativepg

## Global cluster
## skopeo list-tags docker://docker.enterprisedb.com/k8s/edb-cloudnativepg-global-cluster

## EDB Postgres
## skopeo list-tags docker://docker.enterprisedb.com/k8s/postgresql

## EDB Postgres Extended
## skopeo list-tags docker://docker.enterprisedb.com/k8s/edb-postgres-extended

## EDB Postgres Advanced
## skopeo list-tags docker://docker.enterprisedb.com/k8s/edb-postgres-advanced

# ---
# EDB Postgres
export postgres_default_image="docker.enterprisedb.com/k8s/postgresql:17.6"
export postgres_upgrade_image="docker.enterprisedb.com/k8s/postgresql:17.7"

# EDB Postgres Extended
#export postgres_default_image="docker.enterprisedb.com/k8s/edb-postgres-extended:17.6"
#export postgres_upgrade_image="docker.enterprisedb.com/k8s/edb-postgres-extended:17.7"

# EDB Postgres Advanced Server
#export postgres_default_image="docker.enterprisedb.com/k8s/edb-postgres-advanced:17.6"
#export postgres_upgrade_image="docker.enterprisedb.com/k8s/edb-postgres-advanced:17.7"
# ---

# Major upgrade
export postgres_major_upgrade_image="docker.enterprisedb.com/k8s/postgresql:18.1"

# EPAS
export epas_image="docker.enterprisedb.com/k8s/edb-postgres-advanced:17.7"
export epas_storage="512Mi"

# Object Storage environment [minio|aws]
export object_storage_type="minio"

# MinIO
export ACCESS_KEY_ID="minio"
export ACCESS_SECRET_KEY="edb-workshop"
export ACCESS_SESSION_TOKEN=""
export object_storage_bucket="${bucket}"
export s3_destination_path="s3://${bucket}/"

## S3
#export object_storage_bucket="${bucket}"
#export s3_destination_path="s3://${bucket}/"
#export s3_endpoint_url="https://minio-api-minio.apps.cluster-bdb5x.bdb5x.sandbox789.opentlc.com"


# TDE used
# Not yet implemented
export use_tde="N" # Y|N

# Affinity (useful when using Power machines)
# export affinity=$(cat <<EOF
#   affinity:
#     nodeAffinity:
#       requiredDuringSchedulingIgnoredDuringExecution:
#         nodeSelectorTerms:
#           - matchExpressions:
#               - key: machine_type
#                 operator: In
#                 values:
#                   - power
# EOF
#)
