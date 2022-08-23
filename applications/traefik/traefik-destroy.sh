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
        echo "Namesapce $ns exists. Resource deletiion in progress..."
        echo "Services Deletion in Progress...."
            kubectl delete -f ./dashboard/
        sleep 3
            kubectl delete -f 01-secret-cf-certs.yaml
        echo "Clourflare Orgin Certs deleted successfully"
        sleep 3
            kubectl delete -f 02-default-headers.yaml
        echo "Default headers deleted successfully"
        sleep 3
            kubectl delete -f 03-traefik-tls-store.yaml
        echo "Traefik TLS Store deleted successfully"
        echo " Uninstalling Helm Release "
        helm uninstall $service -n $ns
        echo "$ns helm release deleted successfully"
        sleep 10
        kubectl delete pvc --all  -n $ns
        echo "Volumes for $ns has been deleted successfully"
        sleep 5
        kubectl delete namespace $ns
        echo "Namespace $ns has been deleted successfully"
        sleep 3
        echo "Deleting the remaining resource..."
        kubectl delete all --all -n $ns

    else
        echo " Namespace $ns does not exist"
        break
     fi
done