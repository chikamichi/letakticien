#!/bin/bash

set -e
source /docker_scripts/buildconfig
set -x

ruby-switch --set ruby2.3

/docker_scripts/activate_nginx.sh

if [ -n "$DEV_BUILD" ]; then
  /docker_scripts/activate_jekyll_watch.sh
fi

minimal_apt_get_install

/docker_scripts/clean.sh
