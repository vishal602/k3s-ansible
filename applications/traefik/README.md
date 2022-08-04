Deploy Traefik using Helm
# helm repo add traefik https://helm.traefik.io/traefik
# helm repo update
# helm search repo traefik
# helm show values traefik/traefik > ./traefik-values.yaml
Make required changes

#  helm install traefik traefik/traefik --values ./traefik-values.yaml -n traefik

Delete the deployment

helm uninstall traefik -n traefik
