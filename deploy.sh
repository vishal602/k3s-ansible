#!/bin/bash

# On a Frest VM - The below modeles are required to be installed prior to running deploy command
# install Ansible galaxy collection on a new VM if not used before
# ansible-galaxy collection install -r ./collections/requirements.yml
# sudo apt-get -y install python3-netaddr

ansible-playbook site.yml -i ./inventory/my-cluster/hosts.ini --ask-pass --ask-become
