#!/bin/bash
# Keep this box in sync with the Phoenix master

set -eux

cd /etc/puppet/data
git pull origin master
sudo puppet apply manifests/site.pp --modulepath modules $*
