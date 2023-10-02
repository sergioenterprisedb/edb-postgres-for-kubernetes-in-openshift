#!/bin/bash
. ./config.sh
printf "${green}kubectl exec -it cluster-example-13-1 -- psql -U postgres app < ./sql/sqltest.sql${reset}\n"

kubectl exec -it cluster-example-13-1 -- psql -U postgres app < ./sql/sqltest.sql
