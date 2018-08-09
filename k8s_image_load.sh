#!/bin/bash

K8S_VERSION="v1.11.1"
OLD_PER_STR="smartyhero/k8simage"
K8S_IMG_URL="k8s.gcr.io"

COREDNS_VERSION="1.1.3"
ETCD_VERSION="3.2.18"
PAUSE_VERSION="3.1"

node() {

	docker pull ${OLD_PER_STR}-${K8S_VERSION}:kube-proxy-amd64
	docker tag ${OLD_PER_STR}-${K8S_VERSION}:kube-proxy-amd64 ${K8S_IMG_URL}/kube-proxy-amd64:${K8S_VERSION}

	docker pull ${OLD_PER_STR}-${K8S_VERSION}:pause
	docker tag ${OLD_PER_STR}-${K8S_VERSION}:pause ${K8S_IMG_URL}/pause:${PAUSE_VERSION}
	
	docker pull ${OLD_PER_STR}-${K8S_VERSION}:flannel
	docker tag ${OLD_PER_STR}-${K8S_VERSION}:flannel quay.io/coreos/flannel:v0.10.0-amd64
}


master() {
	docker pull ${OLD_PER_STR}-${K8S_VERSION}:kube-apiserver-amd64
	docker tag ${OLD_PER_STR}-${K8S_VERSION}:kube-apiserver-amd64 ${K8S_IMG_URL}/kube-apiserver-amd64:${K8S_VERSION}
	
	docker pull ${OLD_PER_STR}-${K8S_VERSION}:kube-controller-manager-amd64
	docker tag ${OLD_PER_STR}-${K8S_VERSION}:kube-controller-manager-amd64 ${K8S_IMG_URL}/kube-controller-manager-amd64:${K8S_VERSION}
	
	
	docker pull ${OLD_PER_STR}-${K8S_VERSION}:kube-scheduler-amd64
	docker tag ${OLD_PER_STR}-${K8S_VERSION}:kube-scheduler-amd64 ${K8S_IMG_URL}/kube-scheduler-amd64:${K8S_VERSION}
	
	docker pull ${OLD_PER_STR}-${K8S_VERSION}:coredns
	docker tag ${OLD_PER_STR}-${K8S_VERSION}:coredns ${K8S_IMG_URL}/coredns:${COREDNS_VERSION}
	
	docker pull ${OLD_PER_STR}-${K8S_VERSION}:etcd-amd64
	docker tag ${OLD_PER_STR}-${K8S_VERSION}:etcd-amd64 ${K8S_IMG_URL}/etcd-amd64:${ETCD_VERSION}
	
	node	
}
case $1 in
"master")
	master
	;;
"node")
	node
	;;
*)
	echo "Usage: $0 {master|node}"
	;;
esac
