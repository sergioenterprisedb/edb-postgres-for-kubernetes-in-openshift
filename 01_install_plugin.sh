#!/bin/bash
. ./config.sh
printf "${green}https://github.com/EnterpriseDB/kubectl-cnp/raw/main/install.sh | \
  sudo sh -s -- -b /usr/local/bin${reset}\n"

curl -sSfL \
  https://github.com/EnterpriseDB/kubectl-cnp/raw/main/install.sh | \
  sudo sh -s -- -b /usr/local/bin

printf "${green}Pluging kubectl-cnp installed${reset}\n"

