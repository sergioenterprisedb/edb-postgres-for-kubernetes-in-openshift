#!/bin/bash

. ./config.sh

kubectl config set-context --current --namespace=${namespace}
