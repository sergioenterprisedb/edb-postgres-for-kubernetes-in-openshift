#!/bin/bash
. ./config.sh
. ./primary.sh

printf "${green}${kubectl_cmd} exec -n ${namespace} -i ${primary} -- psql -U postgres < ./sql/sqltest.sql${reset}\n"

${kubectl_cmd} exec -n ${namespace} -i ${primary} -- psql -U postgres < ./sql/sqltest.sql
