#!/bin/bash

vmip=$1
if [ $? -ne 0 ];then
	echo "Usage: <cmd> vmip"
fi

sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=$vmip --ignore-preflight-errors=NumCPU

echo "find the kubeadm config file in config map"
echo "kubectl get configMap kubeadm-config -o yaml --namespace=kube-system"
