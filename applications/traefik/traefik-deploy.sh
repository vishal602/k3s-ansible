#!/bin/bash
ns="traefik"
service="traefik"
values="values.yaml"
#values="traefik-values.yaml"
#set +x
timeout_value=5
starttime=$(date +%s)
while [ $(( $(date +%s) - $timeout_value )) -lt $starttime ]; do
status=$(kubectl get ns $ns -o jsonpath='{.status.phase}')
     status=${status:-"X"}
     echo $status
     if [ "$status" == "Active" ];then
        echo " Namespace $ns exists. Application deployment in progress"
        helm install $service $service/$service --values ./$values -n $ns
    else
            echo " Namespace $ns does not exist......"
            echo "Creating namespace $ns"
            kubectl create namespace $ns
        sleep 3
            echo "Installing Traefik Server" 
                helm install $service $service/$service --values ./$values -n $ns
        sleep 3
            echo "Creating Cloulflare Origin Certs as secret" 
                kubectl apply -f 01-secret-cf-certs.yaml
                # kubectl apply -f ./manifest/traefik-pvc.yaml
        sleep 3
            echo "Creating Traefik Default Headers" 
                kubectl apply -f 02-default-headers.yaml
        sleep 3
            echo "Creating TLS Store Certificate" 
                kubectl apply -f 03-traefik-tls-store.yaml
        sleep 10
            echo "---- Creating Services to acess Traefik Dashboard ----"
                kubectl apply -f dashboard/
     
     fi
done
