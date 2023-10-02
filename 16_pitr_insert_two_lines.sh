#!/bin/bash
. ./config.sh
. ./primary.sh

printf "${green}kubectl exec -it ${primary} -- psql < ./pitr/pitr_insert_data_1.sql${reset}\n"

kubectl exec -it ${primary} -- psql -U postgres < ./pitr/pitr_insert_data_1.sql
sleep 5
kubectl exec -it ${primary} -- psql -U postgres < ./pitr/pitr_insert_data_2.sql
