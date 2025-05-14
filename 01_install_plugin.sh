#!/bin/bash
. ./config.sh
print_command "https://github.com/EnterpriseDB/kubectl-cnp/raw/main/install.sh | \
  sh -s -- -b /usr/local/bin\n"

curl -sSfL \
  https://github.com/EnterpriseDB/kubectl-cnp/raw/main/install.sh | \
  sudo sh -s -- -b /usr/local/bin

print_info "Pluging ${kubectl_cnp} installed\n"

