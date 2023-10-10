#!/bin/bash
. ../config.sh
printf "${green}kubectl apply -f \
  https://raw.githubusercontent.com/EnterpriseDB/docs/main/product_docs/docs/postgres_for_kubernetes/1/samples/monitoring/prometheusrule.yaml${reset}\n"

kubectl apply -f \
  https://raw.githubusercontent.com/EnterpriseDB/docs/main/product_docs/docs/postgres_for_kubernetes/1/samples/monitoring/prometheusrule.yaml

printf "${green}kubectl get prometheusrules${reset}\n"
kubectl get prometheusrules

