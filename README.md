# Description
In this demo I'll show you how to create a PostgreSQL cluster with the Red Hat OpenShift operator called EDB Postgres for Kubernetes. The features that I want to show you are:
- Kubernetes plugin install
- EDB Postgres for Kubernetes operator install
- Postgres cluster install
- Insert data in the cluster
- Switchover (promote)
- Failover
- Backup & Recovery (in a S3 Minio platform)
- Scale out/down
- Rolling updates (minor and major)
- Point In Time Recovery (PITR)
- Fencing
- Replication slots (for HA)
- Monitoring (Prometheus/Grafana)
- Operator upgrade
- Last EDB Postgres for Kubernetes tested version is 1.20.2

# Prerequisites
- Red Hat OpenShift environment (Red Hat Code Ready also works)
- oc (OpenShift CLI installed)
- jq (optional if you want to format JSON logs outputs)

# Demo
Execute commands in the correct order:
```
./01_install_plugin.sh
./02_install_operator.sh
./03_check_operator_installed.sh
./05_install_cluster.sh
or
./05_install_cluster_tde.sh
```
Open a new session and execute:
```
./06_show_status.sh
```
Go back to the previous session and execute:
```
./07_insert_data.sh
./08_promote.sh
./09_upgrade.sh
./10_backup_cluster.sh
./11_backup_describe.sh
./12_restore_cluster.sh
./13_failover.sh
./14_scale_out.sh
./15_scale_down.sh

# PITR
./16_pitr_insert_two_lines.sh
./17_pitr_backup.sh
./18_pitr_insert_new_line.sh
./19_pitr_restore_line_one.sh
```
# Major upgrade
Major upgrade feature has been introduced in 1.16 version.
In this demo I show you how to upgrade your cluster from PosgreSQL v13 to v14.
```
./20_create_cluster_v13.sh
./21_insert_data_cluster_v13.sh
./22_verify_data_inserted.sh
./23_upgrade_v13_to_v14.sh
./24_verify_data_migrated.sh
```
Or upgrade your current cluster:
```
./25_upgrade_cluster_to_15.sh
```

# Fencing and Hibernation
```
./30_fencing_on.sh
./31_fencing_off.sh
./32_hibernation_on.sh
./33_hibernation_off.sh
```
# Operator management
```
```
# Deploy pgBouncer (pooling)
```
./60_pgbouncer.sh
```

# Delete clusters
```
./delete_all_clusters.sh
```

# Deploy Prometheus/Grafana monitoring tools
```
cd monitoring
./01_install_prometheus_repo.sh
./02_prometheus_operator.sh
./03_prometheus_rules.sh
./04_grafana_dashboard.sh
./05_port_forwarding_prometheus_grafana.sh

./99_remove_monitoring.sh
```

- To connect to Grafana dashboard: http://localhost:3000
  - **User:** admin
  - **Password:** prom-operator

- To connect to Prometheus dashboard: http://localhost:9090

![](./images/grafana.png)
![](./images/prometheus.png)

# Deploy Minio
```
cd minio
./install_minio.sh

./uninstall_minio.sh
```

# Red Hat Code Ready commands
Console:
```
The server is accessible via web console at:
  https://console-openshift-console.apps-crc.testing
```

Here some Open Shift Code Ready commands:
```
#Use the 'oc' command line interface:
eval $(crc oc-env)
oc login -u developer https://api.crc.testing:6443

# Clean environment
crc delete -f
crc cleanup

# Setup environment
crc setup
crc config set cpus 12
crc config set consent-telemetry no
crc config set memory 16384
crc config set preset openshift

# Start crc
crc start

# Connect to OpenShift platform as admin
oc login -u kubeadmin https://api.crc.testing:6443
```
