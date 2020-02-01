# pan

# Prepering Env
sudo apt install git docker docker-compose
sudo docker swarm init
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install python3.6 python3.6-dev
sudo apt install libmysqlclient-dev
sudo apt install virtualenv

virtualenv venv/ -p /usr/bin/python3.6
source venv/bin/activate