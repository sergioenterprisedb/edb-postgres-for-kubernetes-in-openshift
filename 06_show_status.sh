#!/bin/bash
. ./config.sh
watch -c -n 2 ${kubectl_cnp} status ${cluster_name}

