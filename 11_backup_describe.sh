#!/bin/bash
. ./config.sh
${kubectl_cmd} describe backup backup-test
print_command "${kubectl_cmd} describe backup backup-test\n"
