# EPAS cluster with TDE in Red Hat OpenShift
## Installation
### Prerequisites
Requires EDB Repo 2.0 token (Standard or Enteprise).

Create file .credentials.sh with these values:
```
EDB_SUBSCRIPTION_PLAN=k8s_<your_EDB_SUBSCRIPTION_PLAN>
EDB_SUBSCRIPTION_TOKEN=<your_EDB_SUBSCRIPTION_TOKEN>
EDB_LICENSE_KEY=<your_EDB_LICENSE_KEY>
```
### Create configmap to enable license
```
./01_create_configmap.sh
```

### Install cluster
```
./02_install_cluster_tde.sh
```

### Delete cluster
```
./99_delete_cluster.sh
```

## Test TDE
```
./test_tde.sh
```
