# kubernetes-kubeadm-install
#### Install K8s in single node VM.

* A set of scripts to help you install Kubernetes in single node Ubuntu 18.X - 20.X VMs.
* Use these scripts in the numbering order mentioned in the script name.

#### Steps
1) install_docker_1.sh  
2) install_k8_2.sh  
3) install_k8_3.sh <VMIP> 
  * You should see the following output
```
Your Kubernetes control-plane has initialized successfully!

To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

Alternatively, if you are the root user, you can run:

  export KUBECONFIG=/etc/kubernetes/admin.conf

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join 10.87.69.81:6443 --token kz2cwb.yvyzbjcfod23hft9 \
    --discovery-token-ca-cert-hash sha256:8c14a2b9ccf8163f67eedf8a2217b8621f7b046b05caf99b4b04c8eacb41bee9
``` 
4) install_k8_config_4.sh  
5) install_k8_nw_5.sh
