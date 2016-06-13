#!/bin/sh

# If you omit that part, the command will be run as root.
cd /home/app

if [ -n "$DEV_BUILD" ]; then
  export HOME=/home/app
  exec bundle exec jekyll build --incremental
else
  chown app -R /home/app
  exec /sbin/setuser app bundle exec jekyll build --incremental
fi
