docker stack rm panaya
sleep 20
docker stack deploy -c panaya_stack.yml panaya
