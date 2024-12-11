#!/bin/bash
. ./config.sh
print_command "${kubectl_cnp} hibernate on cluster-sample\n"

${kubectl_cnp} hibernate on cluster-sample

