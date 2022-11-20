#!/bin/bash
sudo ansible-galaxy collection install -r ./collections/requirements.yml
sudo apt-get -y install python3-netaddr
