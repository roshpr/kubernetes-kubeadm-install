#!/bin/bash

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/k8s-manifests/kube-flannel-rbac.yml

echo "Finally, we have to use the kubectl taint command, so that our master node can create pods and be used as a worker node:"
kubectl taint nodes --all node-role.kubernetes.io/master-
