#!/bin/bash
. ./config.sh
. ./primary.sh

printf "${green}${kubectl_cmd} exec -it ${primary} -- psql < ./pitr/pitr_insert_data_3.sql${reset}\n"

${kubectl_cmd} exec -it ${primary} -- psql -U postgres  < ./pitr/pitr_insert_data_3.sql
