#!/bin/bash
#convert the file in executable by using command -- chomod +x longhorn-install.sh
#Installing Longhorn using kubectl manifest
kubectl apply -f longhorn-deploy.yml

#cleanup/delete  long horn
# kubectl delete -f longhorn-uninstall.yml
#kubectl delete -f https://raw.githubusercontent.com/longhorn/longhorn/v1.3.0/examples/storageclass.yaml
