#!/bin/bash
ns="adguard"
service="adguard-stateful.yml"
set +x
timeout_value=3
starttime=$(date +%s)
while [ $(( $(date +%s) - $timeout_value )) -lt $starttime ]; do
status=$(kubectl get ns $ns -o jsonpath='{.status.phase}')
     status=${status:-"X"}
     echo $status
     if [ "$status" == "Active" ];then
        echo " Namespace $ns exists. Application deployment in progress"
        kubectl apply -f $service -n $ns
    else
        echo " Namespace $ns does not exist"
        echo "Creating namespace $ns"
        kubectl apply -f adguard-namespace.yml
        sleep 5
        kubectl apply -f adguard-stateful.yml -n $ns
        
     fi
done
