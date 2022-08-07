#!/bin/bash
ns="traefik"
service="traefik"
values="traefik-values.yaml"
set +x
timeout_value=3
starttime=$(date +%s)
while [ $(( $(date +%s) - $timeout_value )) -lt $starttime ]; do
status=$(kubectl get ns $ns -o jsonpath='{.status.phase}')
     status=${status:-"X"}
     echo $status
     if [ "$status" == "Active" ];then
        echo " Namespace $ns exists. Application deployment in progress"
        helm install $service $service/$service --values ./$values -n $ns
    else
        echo " Namespace $ns does not exist"
        echo "Creating namespace $ns"
            kubectl create namespace $ns
        sleep 5
                kubectl apply -f ./manifest/traefik-pvc.yml
                helm install $service $service/$service --values ./$values -n $ns
        
     fi
done