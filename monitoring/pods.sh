#!/bin/bash

#. ../config.sh

label_cluster_name="k8s\.enterprisedb\.io"
#label_cluster_name="cnpg\.io"

kubectl_filter="\
{range .items[*]}{.metadata.name}{','}\
{.metadata.labels.${label_cluster_name}\/cluster}{','}\
{.items[*]}{.metadata.namespace}{','}\
{.items[*]}{.status.phase}{','}\
{.items[*]}{.status.containerStatuses[*].state.waiting.reason}{','}\
{.spec.containers[*].image}{','}\
{.items[*]}{.metadata.labels.role}{','}\
{.items[*]}{.spec.nodeName}{','}\
{.items[*]}{.metadata.annotations.${label_cluster_name}\/operatorVersion}{'\n'}{end}"

pod_monitor=$(mktemp)
pod_monitor1=$(mktemp)

echo "Instance Name,Cluster,Namespace,Status,Reason,Image Version,Role,Node name,Operator Version" > ${pod_monitor}

#kubectl get pod -A -o=jsonpath="$kubectl_filter" -l 'role in (replica,primary)' | sort -t, -k2,2 -k7,7 >> ${pod_monitor}
kubectl get pod -A -o=jsonpath="$kubectl_filter" -l 'role in (replica,primary)' | sort -t, -k2,2 -k7,7 | \
awk -F, 'BEGIN {OFS=","} {if (length($6) > 10) $6 = substr($6, 1, 30) "..."; print}' >> ${pod_monitor}

# substr
#awk -F',' 'NR==1 {print $0} NR>1 {$1=substr($1, 1, 10); $6=substr($6, 1, 20); OFS=","; print}' ${pod_monitor} > ${pod_monitor}.tmp && mv ${pod_monitor}.tmp ${pod_monitor}
#awk -F',' 'NR==1 {print $0} NR>1 {$6=substr($6, 1, 20); OFS=","; print}' ${pod_monitor} > ${pod_monitor}.tmp && mv ${pod_monitor}.tmp ${pod_monitor}
#awk -F',' 'NR==1 {print $0} NR>1 {$1=substr($1, 1, 10); $6=substr($6, 1, 20); OFS=","; print}' ${pod_monitor} > ${pod_monitor}.tmp && mv ${pod_monitor}.tmp ${pod_monitor}

# If column 5 is empty *
sed -i "" "s|,,|,*,|" ${pod_monitor}
sed -i '' '/replica/s/^/└─> /' ${pod_monitor}
cat ${pod_monitor} | column -s, -t > ${pod_monitor1}

# ANSI color escape codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
BOLD='\033[1;33m'
RESET='\033[0m' # Reset color to default

# Loop through each line in the file
while IFS= read -r line; do
    clusterColor=$(( RANDOM % 256 ))
    # Apply color to each line
    if [[ "$line" == *"Status"* ]]; then
        printf "%b\n" "  ${YELLOW}${BOLD}${line}${RESET}"
    elif [[ "$line" == *"CrashLoopBackOff"* ]]; then
        printf "%b\n" "  ${RED}${line}${RESET}"
    elif [[ "$line" == *"Role"* ]]; then
        printf "%b\n" "  ${WHITE}${line}${RESET}"
    elif [[ "$line" == *"primary"* ]]; then
        printf "%b\n" "\e[38;5;${clusterColor}m■ ${GREEN}${line}${RESET}"
    elif [[ "$line" == *"replica"* ]]; then
        printf "%b\n" "  ${CYAN}${line}${RESET}"
    elif [[ "$line" == *"Pending"* ]]; then
        printf "%b\n" "  ${YELLOW}${line}${RESET}"
    elif [[ "$line" == *"Completed"* ]]; then
        printf "%b\n" "  ${RED}${line}${RESET}"
    else
        printf "%b\n" "${RED}${line}${RESET}"
    fi
done < ${pod_monitor1}
rm ${pod_monitor}
rm ${pod_monitor1}
