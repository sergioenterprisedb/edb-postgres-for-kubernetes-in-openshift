#!/bin/bash

# Author:      Sergio Romera
# Description: Demo config file. Please verify next values:
#              - id: "$(oc whoami)" if doing Red Hat demo. If not, choose your name. 
#              - region: emea|na|apj
#              - bucket_name: common name is pg_backup if you are doing a demo. If you are using AWS, choose your bucket name 
#              - object_storage_type: minio|aws
#              - s3_destination_path and s3_endpoint_url: if you are using minio
#              - s3_destination_path: if you are using aws

git_directory=`git rev-parse --show-toplevel`
. ${git_directory}/commands.sh

#. ./commands.sh

# Variables to be replaced
export id="$(oc whoami)"          # your name or id
export region="emea"              # emea,na,apj
export bucket="cnp"               # S3 bucket name

# Kubernetes environment configuration
export namespace="edb-${region}-${id}"
export kubectl_cmd="oc"
export kubectl_cnp="kubectl-cnp"

# Postgres instance configuration
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

## List version images with skopeo
## https://github.com/containers/skopeo

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
# Open Source Repo
export postgres_default_image="ghcr.io/cloudnative-pg/postgresql:17.6"
export postgres_upgrade_image="ghcr.io/cloudnative-pg/postgresql:17.7"

# EDB Postgres Community Repo
#export postgres_default_image="docker.enterprisedb.com/k8s/postgresql:17.6"
#export postgres_upgrade_image="docker.enterprisedb.com/k8s/postgresql:17.7"

# EDB Postgres Extended Repo
#export postgres_default_image="docker.enterprisedb.com/k8s/edb-postgres-extended:17.6"
#export postgres_upgrade_image="docker.enterprisedb.com/k8s/edb-postgres-extended:17.7"

# EDB Postgres Advanced Server Repo
#
# /!\ Warning /!\: In arm64 architectures, use ubi (Universal Base Images) images
#
#export postgres_default_image="docker.enterprisedb.com/k8s/edb-postgres-advanced:17.7-minimal-ubi9"
#export postgres_upgrade_image="docker.enterprisedb.com/k8s/edb-postgres-advanced:17.9-minimal-ubi9"
# ---

# Major upgrade
export postgres_major_upgrade_image="ghcr.io/cloudnative-pg/postgresql:18.1"

# EPAS (only used for TDE demo)
export epas_image="docker.enterprisedb.com/k8s/edb-postgres-advanced:17.9-minimal-ubi9"
export epas_storage="512Mi"

# Object Storage environment [minio|aws|odf]
export object_storage_type="odf"

# MinIO
# Setup these variables only if using minio object storage
export ACCESS_KEY_ID="minio"
export ACCESS_SECRET_KEY="edb-workshop"
export ACCESS_SESSION_TOKEN=""
export object_storage_bucket="${bucket}"

# Minio in OpenShift
# The Issue: OpenShift Routes (the .apps-crc.testing URL) usually listen on standard ports 80 (HTTP) or 443 (HTTPS).
# By appending :9000 to the Route URL, the traffic is likely hitting a dead end because the OpenShift Router isn't 
# listening for external traffic on 9000.
# The Fix: Since both MinIO and Postgres are inside the same CRC cluster, stop using the Route URL. 
# Use the internal Kubernetes Service DNS instead. It is faster, more reliable, and bypasses the router.
export s3_endpoint_url="https://minio-api-minio.apps.ocp.t8s7c.sandbox5452.opentlc.com/"
export s3_destination_path="s3://${bucket}/"

# S3
# Setup these variables only if using minio object storage
#export object_storage_bucket="${bucket}"
#export s3_destination_path="s3://${bucket}/"

# ODF
# This block is conditionally executed when storage_object_type == odf and a
# marker file .cluster_prepare_done exists, indicating step 04_prepare_cluster.sh
# has been run successfully
if [ $object_storage_type == "odf" ] && [ -f .cluster_prepare_done ]; then
  export OBC_NAME="${id}-backup-bucket"
  export INTERNAL_BUCKET_ENDPOINT="$(oc get cm ${OBC_NAME} -o jsonpath='{.data.BUCKET_HOST}')"
  export BUCKET_NAME="$(oc get cm ${OBC_NAME} -o jsonpath='{.data.BUCKET_NAME}')"
  export ACCESS_KEY_ID="$(oc get secret ${OBC_NAME} -o jsonpath='{.data.AWS_ACCESS_KEY_ID}' | base64 --decode)"
  export ACCESS_SECRET_KEY="$(oc get secret ${OBC_NAME} -o jsonpath='{.data.AWS_SECRET_ACCESS_KEY}' | base64 --decode)"
  export BUCKET_ENDPOINT="https://$(oc get route -n openshift-storage s3 -o jsonpath='{.spec.host}')"
  export s3_destination_path="s3://${BUCKET_NAME}/"
  export s3_endpoint_url="${BUCKET_ENDPOINT}"
  export object_storage_bucket="${BUCKET_NAME}"
fi

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
