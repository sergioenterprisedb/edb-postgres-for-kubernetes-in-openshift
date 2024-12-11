#!/bin/bash
. ./config.sh
. ./primary.sh
. ./env.sh

print_info "Deleting pvc and pod from primary instance ${primary}...\n"
print_command "${kubectl_cmd} delete pvc/${primary} pod/${primary} --force\n"

${kubectl_cmd} delete pvc/${primary} pvc/${primary}-wal pod/${primary} --force
