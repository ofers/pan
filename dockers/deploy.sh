#!/bin/bash
set -e

echo "Cleaning up..."
sudo docker stack rm panaya_db
sudo docker stack rm panaya_web
sleep 20
echo "Start DB container"
sudo docker stack deploy -c panaya_db_stack.yml panaya_db
echo "Build webserver image"
sudo docker build --no-cache -t webserver -f webserver/Dockerfile .
echo "Start DB container"
sudo docker stack deploy -c panaya_web_stack.yml panaya_web

