#/bin/bash

. ./config.sh

kubectl delete secret minio-creds -n ${namespace}

if [[ ! -f ".aws.sh" ]]; then
  echo ""
  echo "Error: File .aws.sh not found."
  echo ""
  echo "Create .aws.sh file with this information:"
  echo ""
  echo "export AWS_ACCESS_KEY_ID=\"<AWS_ACCESS_KEY_ID>\""
  echo "export AWS_SECRET_ACCESS_KEY=\"<AWS_SECRET_ACCESS_KEY>\""
  echo "export AWS_SESSION_TOKEN=\"<AWS_SESSION_TOKEN>\""
  echo ""
  exit 1
fi

. ./.aws.sh

kubectl create secret generic minio-creds \
  --from-literal=ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
  --from-literal=ACCESS_SECRET_KEY=${AWS_SECRET_ACCESS_KEY} \
  --from-literal=ACCESS_SESSION_TOKEN=${AWS_SESSION_TOKEN} \
  --namespace ${namespace}

