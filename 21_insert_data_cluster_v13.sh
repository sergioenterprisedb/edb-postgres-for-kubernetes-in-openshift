#!/bin/bash
. ./config.sh
printf "${green}${kubectl_cmd} exec -it cluster-example-13-1 -- psql -U postgres app < ./sql/sqltest.sql${reset}\n"

${kubectl_cmd} exec -it cluster-example-13-1 -- psql -U postgres app < ./sql/sqltest.sql
