#!/bin/bash

. ./config.sh
primary=`kubectl get pod -o=jsonpath="{range .items[*]}{.metadata.name}{'\t'}{.status.podIP}{'\t'}{.metadata.labels.role}{'\n'}" | grep primary | awk '{print $1}'`
oc exec -it ${primary} -- psql -U postgres

# Other connection command
#kubectl-cnp psql cluster-sample -- -U postgres

