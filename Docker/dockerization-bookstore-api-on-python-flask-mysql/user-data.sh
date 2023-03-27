yum update -y
amazon-linux-extras install docker -y
systemctl docker start
systemctl start docker
groupadd docker
usermod -a -G docker ec2-user
newgrp docker

sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

mkdir -p /home/ec2-user/bookstore
cd /home/ec2-user/bookstore

FOLDER=""
curl -s --create-dirs -o "/home/ec2-user/bookstore/" -L "$FOLDER"bookstore-api.py
curl -s --create-dirs -o "/home/ec2-user/bookstore/" -L "$FOLDER"requirements.txt
curl -s --create-dirs -o "/home/ec2-user/bookstore/" -L "$FOLDER"Dockerfile
curl -s --create-dirs -o "/home/ec2-user/bookstore/" -L "$FOLDER"docker-compose.yaml

docker build -t ...
docker-compose up -d
