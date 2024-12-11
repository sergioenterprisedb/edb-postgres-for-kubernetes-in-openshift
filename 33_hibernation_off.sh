#!/bin/bash
. ./config.sh
print_command "${kubectl_cnp} hibernate off cluster-sample\n"

${kubectl_cnp} hibernate off cluster-sample

