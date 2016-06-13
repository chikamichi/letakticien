#!/bin/bash

set -e
source /docker_scripts/buildconfig
set -x

cd /home/app

if [ -z "$DEV_BUILD" ]; then
  bundle exec jekyll build --incremental
fi
