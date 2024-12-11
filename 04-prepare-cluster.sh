#!/bin/bash

. ./config.sh

#cp yaml/cluster-sample-upgrade-${object_storage_type}.yaml yaml/cluster-sample-upgrade.yaml
#envsubst < yaml/cluster-sample-upgrade-${object_storage_type}.yaml >yaml/cluster-sample-upgrade.yaml

if [ "$object_storage_type" == "aws" ]; then
  print_info "=======================================================\n"
  print_info "AWS secrets\n"
  print_info "-----------\n"
  print_info "Make sure that your AWS credentials are up to date.\n"
  print_info "If this is not the case, please add it in ${yellow}.aws.sh${reset} ${blue}file.\n"
  print_info "=======================================================\n"
  . ./aws_secrets.sh
elif [ "$object_storage_type" == "minio" ]; then
  print_info "Minio secrets not yet configured...\n"
fi

# Create namespace if does not exists
. ./create_namespace.sh

# Set context
./set_context.sh
