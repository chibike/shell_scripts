#!/bin/bash

# Use this tutorial https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04

sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo systemctl status docker
sudo groupadd docker
sudo usermod -aG docker ${USER}

# Uninstall Docker Engine - Community
# 1. Uninstall the Docker Engine - Community package:
# sudo apt-get purge docker-ce

# 2. Images, containers, volumes, or customized configuration files on your host are not automatically removed. To delete all images, containers, and volumes:
# sudo rm -rf /var/lib/docker
