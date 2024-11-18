#!/bin/bash

. ../config.sh

kubectl get nodes -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.capacity.cpu}{"\n"}{end}' --namespace ${namespace}

