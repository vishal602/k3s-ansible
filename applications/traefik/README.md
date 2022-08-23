Deploy Traefik using Helm
# helm repo add traefik https://helm.traefik.io/traefik
# helm repo update
# helm search repo traefik
# helm show values traefik/traefik > ./traefik-values.yaml
Make required changes

#  helm install traefik traefik/traefik --values ./traefik-values.yaml -n traefik

Delete the deployment

helm uninstall traefik -n traefik
# Ref URL: https://blog.nobugware.com/post/enabling-cloudflare-in-front-of-your-kubernetes-cluster-with-traefik/
# Using Cloudflare Wildcard Certs - 15 years validity
# Download the certs and create files - origin.crt and origin.key
# Apply certs as a secret in kube-system namespace using the below command or use the manifest files
# kubectl -n kube-system create secret generic default-certificate --from-file=tls.crt=./origin.crt --from-file=tls.key=./origin.key
