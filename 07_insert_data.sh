#!/bin/bash
. ./config.sh
. ./primary.sh

printf "${green}kubectl exec -i ${primary} -- psql -U postgres < ./sql/sqltest.sql${reset}\n"

kubectl exec -i ${primary} -- psql -U postgres < ./sql/sqltest.sql
