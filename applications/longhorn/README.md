# Longhorn Installation instructions using Helm
# ----------------------------------------------
# Search if repo exists
helm search repo longhorn
# Step:1 Adding longhorn helm Repo
helm repo add longhorn https://charts.longhorn.io
# Step 2: Running helm repo update
helm repo update
# Step 3: Downloading longhorn values before installing
helm show values longhorn/longhorn > /tmp/longhorn-values.yaml
# Step 3: Installing Longhorn using Helm using the modified values file
helm install longhorn longhorn/longhorn --values ./longhorn-values.yaml -n longhorn-system --create-namespace

# Upgrading after making changes 
helm upgrade longhorn longhorn/longhorn --values ./longhorn-values.yaml -n longhorn-system

# Uninstall Helm Repo
helm uninstall longhorn onghorn/longhorn -n longhorn-system
