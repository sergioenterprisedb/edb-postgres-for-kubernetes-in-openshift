#!/bin/bash

. ../config.sh

${kubectl_cmd} delete jobs pgbench-init
${kubectl_cmd} delete jobs pgbench-run


