#!/bin/bash

mkdir $HOME/.k8s

sudo cp /etc/kubernetes/admin.conf $HOME/.k8s/

sudo chown $(id -u):$(id -g) $HOME/.k8s/admin.conf

export KUBECONFIG=$HOME/.k8s/admin.conf

echo "export KUBECONFIG=$HOME/.k8s/admin.conf" | tee -a ~/.bashrc
