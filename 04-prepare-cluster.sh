#!/bin/bash

. ./config.sh
. ./commands.sh

#Doc
echo "04" > ./docs/docid

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
  print_info "Minio secrets configuration...\n"
  
  print_command "${kubectl_cmd} delete secret minio-creds"
  print_command "${kubectl_cmd} create secret generic minio-creds \\
    --from-literal=ACCESS_KEY_ID=${ACCESS_KEY_ID} \\
    --from-literal=ACCESS_SECRET_KEY=${ACCESS_SECRET_KEY}\n"

  ${kubectl_cmd} delete secret minio-creds
  ${kubectl_cmd} create secret generic minio-creds \
    --from-literal=ACCESS_KEY_ID=${ACCESS_KEY_ID} \
    --from-literal=ACCESS_SECRET_KEY=${ACCESS_SECRET_KEY}
elif [ "$object_storage_type" == "odf" ]; then
  print_info "ODF s3 bucket configuration...\n"
  envsubst < ./yaml/object_bucket_claim.yaml | ${kubectl_cmd} apply -n ${namespace} -f -

  # wait until cm and secret have been created
  until oc get cm ${id}-backup-bucket &>/dev/null; do
    print_info "Wait until s3 bucket config map and secret have been created"
    sleep 2
  done
fi

# Set context
./set_context.sh
