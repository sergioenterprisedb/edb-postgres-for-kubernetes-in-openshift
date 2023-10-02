#!/bin/bash
. ../config.sh
printf "${green}helm upgrade --install -n default \
  -f https://raw.githubusercontent.com/EnterpriseDB/docs/main/product_docs/docs/postgres_for_kubernetes/1/samples/monitoring/kube-stack-config.yaml \
 prometheus-community \
 prometheus-community/kube-prometheus-stack${reset}\n"

helm upgrade --install -n default \
  -f https://raw.githubusercontent.com/EnterpriseDB/docs/main/product_docs/docs/postgres_for_kubernetes/1/samples/monitoring/kube-stack-config.yaml \
 prometheus-community \
 prometheus-community/kube-prometheus-stack
