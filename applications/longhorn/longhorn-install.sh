#!/bin/bash
#convert the file in executable by using command -- chomod +x longhorn-install.sh
#Search if repo exists
#helm search repo longhorn
#Installing using heml
#Step:1 Adding Help Repo
#helm repo add longhorn https://charts.longhorn.io
#Step 2: Running helm repo update
#helm repo update
#Step 3: Downloading longhorn values before installing
#helm show values longhorn/longhorn > /tmp/longhorn-values.yaml
#Step 3: Installing Longhorn using Helm
#helm install longhorn longhorn/longhorn --values ./longhorn-values.yaml -n longhorn-system --create-namespace

#If you want to make any changes to values file or upgrade longhorn using helm the command below
#helm upgrade longhorn longhorn/longhorn --values ./longhorn-values.yaml -n longhorn-system


#Installing Longhorn using kubectl manifest
kubectl apply -f longhorn-deploy.yml

#cleanup/delete  long horn
# kubectl delete -f longhorn-uninstall.yml
#kubectl delete -f https://raw.githubusercontent.com/longhorn/longhorn/v1.3.0/examples/storageclass.yaml
