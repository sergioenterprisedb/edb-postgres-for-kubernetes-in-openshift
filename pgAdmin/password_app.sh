#!/bin/bash

kubectl get secret --namespace openshift-operators cluster-sample-app -o jsonpath="{.data.password}" | base64 --decode
echo ""


