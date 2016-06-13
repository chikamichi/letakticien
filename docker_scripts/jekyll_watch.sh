#!/bin/sh

cd /home/app

# export HOME=/home/app
exec bundle exec jekyll build --watch #--trace --verbose
