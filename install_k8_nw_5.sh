#!/bin/bash
# Fix flannel subnet file createion error: https://github.com/kubernetes/kubernetes/issues/70202
echo "
FLANNEL_NETWORK=10.244.0.0/16
FLANNEL_SUBNET=10.244.0.1/24
FLANNEL_MTU=1450
FLANNEL_IPMASQ=true
" > /run/flannel/subnet.env
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/k8s-manifests/kube-flannel-rbac.yml

echo "Finally, we have to use the kubectl taint command, so that our master node can create pods and be used as a worker node:"
kubectl taint nodes --all node-role.kubernetes.io/master-
