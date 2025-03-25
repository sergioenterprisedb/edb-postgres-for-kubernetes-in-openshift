# Intro
In this demo I'll show you how to create a PostgreSQL cluster with the Red Hat OpenShift operator called EDB CloudNativePG.
The features that I want to show you are:
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

# Demo prep
To use this demo the following software is needed:
- Red Hat OpenShift 4.x

## Prerequisites
- Red Hat OpenShift environment (Red Hat Code Ready also works)
- oc (OpenShift CLI installed)
- jq (optional if you want to format JSON logs outputs)
- Modify `config.sh` file with your parameters:
  - Replace variables:
    - `id` : with your name or id
    - `region`: region in which you deploy your clusters: `[emea|na|apj]`
    - `bucket`: Your S3 bucket where you store your backups and Postgres wals.

## Credentials
Create a file `.aws.sh` with this information:
```
export AWS_ACCESS_KEY_ID="<AWS_ACCESS_KEY_ID>"
export AWS_SECRET_ACCESS_KEY="<AWS_SECRET_ACCESS_KEY>"
export AWS_SESSION_TOKEN="<AWS_SESSION_TOKEN>"
```
## Demo namespace structure
```
Namespaces

├── edb-emea-user1
│   ├─ cluster-user1
│   ├─ cluster-user1-17
│   ├─ cluster-restore
├── edb-emea-user2
│   ├─ cluster-user2
│   ├─ cluster-user2-17
│   ├─ cluster-restore
├── edb-na-user3
│   ├─ cluster-user3
├── edb-na-user4
│   ├─ cluster-user4
│   ├─ cluster-user4-17
│   ├─ cluster-restore
├── edb-apj-user5
└── edb-apj-user6
    ├─ cluster-user6
    ├─ cluster-user6-17
    └─ cluster-restore
```

## Dashboard
File `.env.sh` show all the env variables created to manage
the PostgreSQL clusters in Red Hat OpensShift. This is an example:
```
./env.sh
----------------------------------------------------------------------------------------------
⎈ Kubernetes environment ⎈
----------------------------------------------------------------------------------------------
Context
├─ Current name            : docker-desktop
├─ Current cluster         : docker-desktop
└─ Current namespace       : edb-emea-pgcluster
Pods
└─ Sum of pod CPU's        : 1.5 / 12
Nodes
├─ Total K8s nodes         : 1
└─ Number of CPU's per node: 12
Kubernetes Namespace       : edb-emea-pgcluster

----------------------------------------------------------------------------------------------
PostgreSQL Cluster configuration
----------------------------------------------------------------------------------------------
PostgreSQL Cluster Name    : cluster-pgcluster
Postgres Instances         : 3
Postgres CPU's             : 0.5
Postgres Memory            : 512Mi
Postgres storage           : 512Mi
Postgres WAL storage       : 512Mi

----------------------------------------------------------------------------------------------
Object Storage
----------------------------------------------------------------------------------------------
Object Storage type        : aws
Object Storage bucket      : <your-bucket>
Destination path           : s3://<your-bucket>/
Endpoint                   : 

----------------------------------------------------------------------------------------------
Transparent Data Encryption (TDE)
----------------------------------------------------------------------------------------------
Using TDE (in progress)    : N
```

# Demo flow
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
# Backup and Recovery
```
10_backup_cluster.sh
11_backup_describe.sh
12_restore_cluster.sh
```
# Failover
```
13_failover.sh
```
# Scale out and down
```
14_scale_out.sh
15_scale_down.sh
```
# PITR (Point in Time Recovery)
```
16_pitr_insert_two_lines.sh
17_pitr_backup.sh
18_pitr_insert_new_line.sh
19_pitr_restore_line_one.sh
```
# Major Upgrade
```
20_upgrade_major_version.sh
```
# Fencing
```
30_fencing_on.sh
31_fencing_off.sh
```
# Hibernation
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
