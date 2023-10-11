#!/bin/bash
. ./config.sh
printf "${green}${kubectl_cmd} exec -it cluster-example-13-1 -- psql -U postgres -c 'select count(*) from test;'${reset}\n"

${kubectl_cmd} exec -it cluster-example-13-1 -- psql -U postgres -c "select count(*) from test;" app

