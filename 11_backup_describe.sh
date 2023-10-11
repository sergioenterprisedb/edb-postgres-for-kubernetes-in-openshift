#!/bin/bash
. ./config.sh
${kubectl_cmd} describe backup backup-test
printf "${green}${kubectl_cmd} describe backup backup-test${reset}\n"
