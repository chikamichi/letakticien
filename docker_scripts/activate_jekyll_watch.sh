#!/bin/bash

set -e
source /docker_scripts/buildconfig
set -x

mkdir /etc/service/jekyll_watch
mv /docker_scripts/jekyll_watch.sh /etc/service/jekyll_watch/run
chmod +x /etc/service/jekyll_watch/run
