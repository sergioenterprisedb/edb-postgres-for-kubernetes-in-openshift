kubectl delete -f https://raw.githubusercontent.com/EnterpriseDB/docs/main/product_docs/docs/postgres_for_kubernetes/1/samples/monitoring/grafana-configmap.yaml
kubectl delete -f https://raw.githubusercontent.com/EnterpriseDB/docs/main/product_docs/docs/postgres_for_kubernetes/1/samples/monitoring/prometheusrule.yaml
sleep 2
helm uninstall -n default prometheus-community prometheus-community/kube-prometheus-stack

helm repo remove prometheus-community
helm repo update

# https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack
kubectl delete crd alertmanagerconfigs.monitoring.coreos.com
kubectl delete crd alertmanagers.monitoring.coreos.com
kubectl delete crd podmonitors.monitoring.coreos.com
kubectl delete crd probes.monitoring.coreos.com
kubectl delete crd prometheusagents.monitoring.coreos.com
kubectl delete crd prometheuses.monitoring.coreos.com
kubectl delete crd prometheusrules.monitoring.coreos.com
kubectl delete crd scrapeconfigs.monitoring.coreos.com
kubectl delete crd servicemonitors.monitoring.coreos.com
kubectl delete crd thanosrulers.monitoring.coreos.com

kubectl delete namespace monitoring
kubectl delete namespace default

kubectl delete service prometheus
kubectl delete route prometheus
kubectl delete job prometheus-community-kube-admission-create
kubectl delete deployment prometheus

# Default deployemnts
kubectl delete deployment -n default prometheus-community-grafana
kubectl delete deployment -n default prometheus-community-kube-operator 
kubectl delete deployment -n default prometheus-community-kube-state-metrics 

# Delete route
kubectl delete -f route_monitoring.yaml

