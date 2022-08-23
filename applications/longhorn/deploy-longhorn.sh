#!/bin/bash

#Deploying longhorn using Helm Chart
set -x

helm install longhorn longhorn/longhorn --values ./longhorn-values.yaml -n longhorn-system --create-namespace
