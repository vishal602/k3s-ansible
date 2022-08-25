#!/bin/bash
ns="traefik"
service="traefik"
values="values.yaml"
# Upgrading Traefik 
set -x

helm upgrade $service $service/$service --values ./$values -n $ns
