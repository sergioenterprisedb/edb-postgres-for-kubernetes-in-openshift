#!/bin/bash
. ../config.sh
. ../primary.sh

${kubectl_cmd} exec -it ${primary} -- psql -U postgres > tde_file.log <<EOF
drop table users;
create table users (userid int, password varchar(100));
insert into users values (1, 'Thisismypassword01#');

-- Flush dirty pages
checkpoint;

select pg_relation_filepath('users');
EOF

export tde_file=`grep base tde_file.log`
export tde_pgdata=`${kubectl_cmd} exec -it cluster-sample-1 -- bash -c 'echo $PGDATA'`
echo "tde_pgdata: $tde_pgdata"
echo "tde_file: $tde_file"
export tde_file=`echo $tde_file | tr -s ' '`
tde_cmd="${kubectl_cmd} exec -it cluster-sample-1 -- bash -c 'hexdump -C /var/lib/postgresql/data/pgdata/${tde_file}'"
echo "$tde_cmd"
eval $tde_cmd
