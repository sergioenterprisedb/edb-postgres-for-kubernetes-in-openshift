#!/bin/bash
. ./config.sh

kubectl apply -f /yaml/pgbouncer.yaml
sleep 5

kubectl port-forward service/pooler-sample-rw  6432:5432 &
pid1=$!
sleep 1

kubectl port-forward service/cluster-sample-rw  7432:5432 &
pid2=$!
sleep 1

export PGPASSWORD=$(kubectl get secret cluster-sample-superuser -o jsonpath="{.data.password}" | base64 --decode)
echo $PGPASSWORD
kubectl get pod -o wide
kubectl get cluster

echo "Init pbbouncer"
#pgbench -h localhost -p 6432 -i -I d
#pgbench -h localhost -p 7432 -i -I d
#pgbench -h localhost -p 6432 -i -U postgres postgres
#pgbench -h localhost -p 7432 -i -U postgres postgres

echo "Test Pooler RW"
oc exec -it ${primary} -- psql -U postgres -c "select inet_server_Addr();"
#psql -h localhost -p 6432 -U postgres postgres -c "select inet_server_Addr();"
pgbench -h localhost -p 6432 -T 15 -c 5 -j 4 -U postgres postgres
#pgbench -h localhost -p 6432 -t 100 -c 10 -j 4 -U postgres postgres

echo "Test pod RW"
oc exec -it ${primary} -- psql -U postgres -c "select inet_server_Addr();"
#psql -h localhost -p 7432 -U postgres postgres -c "select inet_server_Addr();"
pgbench -h localhost -p 7432 -T 15 -c 5 -j 4 -U postgres postgres
#pgbench -h localhost -p 7432 -t 100 -c 10 -j 4 -U postgres postgres
kill $pid1
kill $pid2

