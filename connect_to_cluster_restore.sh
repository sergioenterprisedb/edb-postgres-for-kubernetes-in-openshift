#!/bin/bash

. ./config.sh
restore=`kubectl get pod -o=jsonpath="{range .items[*]}{.metadata.name}{'\t'}{.status.podIP}{'\t'}{.metadata.labels.role}{'\n'}" | grep restore | awk '{print $1}'`
oc exec -it ${restore} -- psql -U postgres

# Other connection command
#kubectl-cnp psql cluster-sample -- -U postgres

