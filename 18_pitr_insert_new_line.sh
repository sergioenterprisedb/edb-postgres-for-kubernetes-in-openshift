#!/bin/bash
. ./config.sh
. ./primary.sh

#Doc
echo "18" > ./docs/docid

print_command "${kubectl_cmd} exec -it ${primary} -- psql < ./pitr/pitr_insert_data_3.sql\n"

${kubectl_cmd} exec -it ${primary} -- psql -U postgres  < ./pitr/pitr_insert_data_3.sql
