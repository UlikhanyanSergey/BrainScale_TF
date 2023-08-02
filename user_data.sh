#!/bin/bash
sudo apt update

sudo apt install apt-transport-https -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce -y
sudo gpasswd -a ubuntu docker
newgrp docker
sudo service docker enable

sudo apt install awscli -y

git clone https://github.com/brainscalesolutions/brainscale-simple-app.git
#aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 421279864461.dkr.ecr.eu-central-1.amazonaws.com/my-app:latest
#docker run -d -p 3000:3000 421279864461.dkr.ecr.eu-central-1.amazonaws.com/my-app:latest
docker build -t my_app:latest .
docker run -d -p 3000:3000 my_app:latest