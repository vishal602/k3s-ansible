#!/bin/bash

#Deploying Helm Chart
set -x
#

#uninstalling helm chart
helm upgrade longhorn longhorn/longhorn --values ./longhorn-values.yaml -n longhorn-system