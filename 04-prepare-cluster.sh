#!/bin/bash

. ./config.sh
. ./commands.sh

#Doc
echo "04" > ./docs/docid

# Check credentials
if [[ -f ".credentials.sh" ]]; then
   . ./.credentials.sh
else
  echo ""
  echo "File .credentials.sh does not exist"
  echo "Please, create file .credentials.sh with this value:"
  echo ""
  exit 1
fi

if [[ -z "${EDB_SUBSCRIPTION_TOKEN}" ]]; then
  echo ""
  echo "Warning:"
  echo "********"
  echo "EDB_SUBSCRIPTION_TOKEN is not set."
  echo "Please, create file .credentials.sh with this value:"
  echo "export EDB_SUBSCRIPTION_TOKEN=\"<your-token>\" > .credentials.sh"
  echo ""
  exit 1
else
  print_info "Connecting to EDB Repo...\n"
  . ./connect_edb_token.sh
  if [ $? -eq 1 ]; then
    print_error "Error: something went wrong connecting to EDB Repo\n"
    exit 1
  fi
fi

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
fi

# Set context
./set_context.sh
