#!/bin/bash
. ./config.sh
watch -c -n 2 ${kubectl_cnp} -n ${namespace} --color always status ${cluster_name}

