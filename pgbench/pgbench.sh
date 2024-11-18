#!/bin/bash
. ../config.sh

${kubectl_cmd} delete jobs pgbench-init
${kubectl_cmd} delete jobs pgbench-run
sleep 4 
 
${kubectl_cmd} cnp pgbench \
  --job-name pgbench-init cluster-sample   \
  -- --initialize \
  --scale 20 

sleep 15 

${kubectl_cmd} logs  jobs/pgbench-init
sleep 2

${kubectl_cmd} cnp pgbench \
  --job-name pgbench-run \
  cluster-sample \
  -- --time 20 \
  --client 16 \
  --jobs 8

sleep 40

${kubectl_cmd} logs jobs/pgbench-run

