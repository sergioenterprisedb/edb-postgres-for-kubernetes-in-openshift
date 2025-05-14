#!/bin/bash
. ./config.sh
. ./primary.sh

#Doc
echo "07" > ./docs/docid

print_command "${kubectl_cmd} exec -n ${namespace} -i ${primary} -- psql -U postgres < ./sql/sqltest.sql\n"

${kubectl_cmd} exec -n ${namespace} -i ${primary} -- psql -U postgres < ./sql/sqltest.sql
