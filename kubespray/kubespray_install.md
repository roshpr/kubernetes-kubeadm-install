# Kubespray standalone node install

## PreReq
* The installation is for standalone Kubernetes.
* These steps can be followed to run K8 install from within K8 node to be installed or a separate bootstrap or installer VM.
* Below steps are tested with user root only.
# Install kubernetes using kubespray 
* Install kubectl on Linux
  * ```curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"```
  * ```chmod +x kubectl; mv kubectl /usr/bin``` 
### Initial setup

* Download kubespray code
  * ```wget https://github.com/kubernetes-sigs/kubespray/archive/refs/heads/master.zip```
* Install ansible
  * ```apt-get install ansible```
* Install python dependencies of kubespray
  * ```pip3 install -r requirements.txt```
  * ```pip3 install -y ruamel.yaml```
* Make a copy of the default sample cluster config
  * declare -r CLUSTER_FOLDER='newcluster' 
  * ```cp -r inventory/sample inventory/$CLUSTER_FOLDER``` 
* Prepare install config with the VM IPs. The below step will populate hosts.yaml with the node ips in variable IPS given below.
```
  * declare -a IPS=(172.31.6.123 172.31.38.116)
  * CONFIG_FILE=inventory/$CLUSTER_FOLDER/hosts.yaml  python3 contrib/inventory_builder/inventory.py ${IPS[@]}
``` 
* Uncomment the kubenetes read port (line content given below) in the file : inventory/$CLUSTER_FOLDER/group_vars/all/all.yml
  * ```kube_read_only_port: 10255``` 
* Create a ssh key and copy the public key content to the all nodes .ssh/authorized_keys file and place the private key in installation node.
  * ```ssh-keygen -b2048``` 
  * ```cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys```
* Install K8s
  * ```ansible-playbook -i inventory/$CLUSTER_FOLDER/hosts.yaml cluster.yml -u ubuntu -b```

* Output
```
PLAY RECAP *********************************************************************************************************************************************************************************************************************
localhost                  : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
node1                      : ok=539  changed=15   unreachable=0    failed=0    skipped=1157 rescued=0    ignored=1
node2                      : ok=347  changed=13   unreachable=0    failed=0    skipped=644  rescued=0    ignored=1
```
