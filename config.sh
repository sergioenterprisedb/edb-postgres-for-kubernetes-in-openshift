#!/bin/bash

# Kubernetes environment
kubectl_cmd="oc"
kubectl_cnp="kubectl-cnp"
cluster_name="cluster-sample"
#namespace="default"
namespace="edb-test"
#namespace="openshift-operators"
env="test"

# Object storage environment [aws|minio]
object_storage_type="aws"

# Colors
reset="\e[0m" #reset color
green="\e[32m"
red="\e[31m"
yellow="\e[33m"
