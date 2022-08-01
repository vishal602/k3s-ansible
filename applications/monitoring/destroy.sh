#!/bin/bash

#Deploying Helm Chart
set -x
#

#uninstalling helm chart
helm uninstall -n monitoring prometheus