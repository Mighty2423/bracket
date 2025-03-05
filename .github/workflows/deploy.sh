#!/bin/bash

# Update and install dependencies
sudo apt update -y
sudo apt install -y docker.io git mysql-server

# Start Docker
sudo systemctl start docker
sudo systemctl enable docker

# Clone your GitHub repo
cd /home/ubuntu
git clone https://github.com/Mighty2423/bracket.git
cd bracket

# Build and run the Docker container
sudo docker build -t bracket-app .
sudo docker run -d -p 80:80 bracket-app
