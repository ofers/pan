#!/bin/bash
set -e

echo "Updating index.html on webserver from DB"
echo "Rebuilding webserver image"
sudo docker build --no-cache -t webserver -f webserver/Dockerfile .
WEBCON=`sudo docker ps -f name=web -q`
echo "Restarting container ${WEBCON}"
sudo docker container restart ${WEBCON}
