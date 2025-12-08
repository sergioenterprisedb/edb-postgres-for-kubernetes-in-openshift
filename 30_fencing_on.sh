. ./config.sh

#Doc
echo "30" > ./docs/docid

print_command "${kubectl_cnp} fencing on ${cluster_name} ${cluster_name}-3\n"
${kubectl_cnp} fencing on ${cluster_name} ${cluster_name}-3

