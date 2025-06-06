#!/bin/bash

. ../config.sh

kubectl get secret --namespace ${namespace} cluster-sample-app -o jsonpath="{.data.password}" | base64 --decode
echo ""


