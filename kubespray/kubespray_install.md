### Initial setup
* Download kubespray code
  * ```wget https://github.com/kubernetes-sigs/kubespray/archive/refs/heads/master.zip```
* Install ansible
  * ```apt-get install ansible```
* Install python dependencies of kubespray
  * ```pip3 install -r requirements.txt```
* Make a copy of the default sample cluster config
  * ```cp -r inventory/sample inventory/newcluster``` 
* Prepare install config with the VM IPs. The below step will populate hosts.yaml with the node ips in variable IPS given below.
```
  * declare -a IPS=(172.31.6.123 172.31.38.116)
  * CONFIG_FILE=inventory/mycluster/hosts.yaml  python3 contrib/inventory_builder/inventory.py ${IPS[@]}
``` 
* Uncomment the kubenetes read port (line content given below) in the file : inventory/mycluster/group_vars/all/all.yml
  * ```kube_read_only_port: 10255``` 
* Create a ssh key and copy the public key content to the all nodes .ssh/authorized_keys file and place the private key in installation node.
* Install K8s
  * ```ansible-playbook -i inventory/mycluster/hosts.yaml cluster.yml -u ubuntu -b```

* Output
```
PLAY RECAP *********************************************************************************************************************************************************************************************************************
localhost                  : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
node1                      : ok=539  changed=15   unreachable=0    failed=0    skipped=1157 rescued=0    ignored=1
node2                      : ok=347  changed=13   unreachable=0    failed=0    skipped=644  rescued=0    ignored=1
```
