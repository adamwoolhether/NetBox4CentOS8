#!/bin/sh

# A simple script to update the Netbox version.
# Assumes you've installed with Git repository.
# If you installed Netbox with tarball or ZIP, follow 'Option A' at: https://netbox.readthedocs.io/en/stable/installation/upgrading/
set -e
cd /opt/netbox
sudo git checkout master
sudo git pull origin master
sudo ./upgrade.sh