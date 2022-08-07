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
        echo " Namespace $ns exists. Application deletion in progress"
        helm uninstall $service -n $ns
        echo "Services of $ns deleted successfully"
        sleep 10
        kubectl delete pvc --all  -n $ns
        echo "Volumes for $ns has been deleted successfully"
        sleep 5
        kubectl delete namespace $ns
        echo "Namespace $ns has been deleted successfully"
    else
        echo " Namespace $ns does not exist"
        break
     fi
done