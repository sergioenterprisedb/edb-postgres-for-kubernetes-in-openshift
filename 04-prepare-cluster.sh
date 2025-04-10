#!/bin/bash

. ./config.sh

# Create namespace if does not exists
. ./create_namespace.sh

if [ "$object_storage_type" == "aws" ]; then
  print_info "=======================================================\n"
  print_info "AWS secrets\n"
  print_info "-----------\n"
  print_info "Make sure that your AWS credentials are up to date.\n"
  print_info "If this is not the case, please add it in ${yellow}.aws.sh${reset} ${blue}file.\n"
  print_info "=======================================================\n"
  . ./aws_secrets.sh
elif [ "$object_storage_type" == "minio" ]; then
  print_info "Minio secrets configured...\n"
  ${kubectl_cmd} delete secret minio-creds
  ${kubectl_cmd} create secret generic minio-creds \
    --from-literal=ACCESS_KEY_ID=${ACCESS_KEY_ID} \
    --from-literal=ACCESS_SECRET_KEY=${ACCESS_SECRET_KEY}
fi

# Set context
./set_context.sh
