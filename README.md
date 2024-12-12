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
- Monitoring (scripts)
- Operator upgrade

# Prerequisites
- Red Hat OpenShift environment (Red Hat Code Ready also works)
- oc (OpenShift CLI installed)
- jq (optional if you want to format JSON logs outputs)

# Demo
Execute commands in the correct order:
```
01_install_plugin.sh
02_install_operator.sh
03_check_operator_installed.sh
04-prepare-cluster.sh
05_install_cluster.sh
06_show_status.sh
07_insert_data.sh
08_promote.sh
09_upgrade.sh
```
Backup and Recovery
```
10_backup_cluster.sh
11_backup_describe.sh
12_restore_cluster.sh
```
Failover
```
13_failover.sh
```
Scale out and down
```
14_scale_out.sh
15_scale_down.sh
```
PITR (Point in Time Recovery)
```
16_pitr_insert_two_lines.sh
17_pitr_backup.sh
18_pitr_insert_new_line.sh
19_pitr_restore_line_one.sh
```
Major Upgrade
```
20_upgrade_major_version.sh
````
Fencing
```
30_fencing_on.sh
31_fencing_off.sh
```
Hibernation
```
32_hibernation_on.sh
33_hibernation_off.sh
```

# Fencing and Hibernation
```
./30_fencing_on.sh
./31_fencing_off.sh
./32_hibernation_on.sh
./33_hibernation_off.sh

```
# Delete clusters
```
99_delete_env.sh
```
