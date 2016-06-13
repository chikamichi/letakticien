#!/bin/bash

set -e
source /docker_scripts/buildconfig
set -x

rm -f /etc/service/nginx/down
rm /etc/nginx/sites-enabled/default

if [ -n "$DEV_BUILD" ]; then
  mv /docker_scripts/webapp.local.conf /etc/nginx/sites-enabled/webapp.conf
else
  mv /docker_scripts/webapp.conf /etc/nginx/sites-enabled/webapp.conf
fi
