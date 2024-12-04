#!/bin/bash

. ./config.sh

cp yaml/cluster-sample-upgrade-${object_storage_type}.yaml yaml/cluster-sample-upgrade.yaml

if [ "$object_storage_type" == "aws" ]; then
  echo "AWS secrets..."  
  . ./aws_secrets.sh
elif [ "$object_storage_type" == "minio" ]; then
  echo "Minio secrets not yet configured..."
fi
