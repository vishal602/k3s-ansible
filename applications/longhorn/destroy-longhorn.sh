#!/bin/bash

#Deploying Helm Chart
set -x
#

#uninstalling helm chart
helm uninstall longhorn onghorn/longhorn -n longhorn-system