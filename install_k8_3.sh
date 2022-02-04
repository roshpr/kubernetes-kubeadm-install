#!/bin/bash

vmip=$1
if [ $? -ne 0 ];then
	echo "Usage: <cmd> vmip"
fi
### Avoid docker systemd error: https://github.com/schoolofdevops/kubernetes-labguide/issues/10
echo '{"exec-opts": ["native.cgroupdriver=systemd"]}' >> /etc/docker/daemon.json
systemctl restart docker
###
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=$vmip --ignore-preflight-errors=NumCPU

echo "find the kubeadm config file in config map"
echo "kubectl get configMap kubeadm-config -o yaml --namespace=kube-system"
