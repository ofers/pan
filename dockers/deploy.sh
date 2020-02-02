sudo docker stack rm panaya
sleep 20
sudo docker stack deploy -c panaya_db_stack.yml panaya_db
