#!/bin/bash

. ./config.sh

#cp yaml/cluster-sample-upgrade-${object_storage_type}.yaml yaml/cluster-sample-upgrade.yaml
#envsubst < yaml/cluster-sample-upgrade-${object_storage_type}.yaml >yaml/cluster-sample-upgrade.yaml

if [ "$object_storage_type" == "aws" ]; then
  print_info "AWS secrets...\n"  
  . ./aws_secrets.sh
elif [ "$object_storage_type" == "minio" ]; then
  print_info "Minio secrets not yet configured...\n"
fi

# Create namespace if does not exists
. ./create_namespace.sh

# Set context
./set_context.sh
