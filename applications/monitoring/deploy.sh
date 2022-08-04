#!/bin/bash

#Deploying Helm Chart
set -x
# kubectl create namespace monitoring
# sleep 3

# kubectl apply -f grafana-secret.yaml
# sleep 3

helm install -n monitoring prometheus prometheus-community/kube-prometheus-stack -f values.yaml

#uninstalling helm chart
#helm uninstall -n monitoring prometheus

#check the status of the stack
#kubectl --namespace monitoring get pods -l "release=prometheus"

#upgrade the stack
#helm upgrade -n monitoring prometheus prometheus-community/kube-prometheus-stack --values ./values.yaml
