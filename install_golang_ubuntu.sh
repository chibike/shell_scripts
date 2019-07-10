#!/bin/bash

# update
sudo apt-get update
sudo apt-get -y upgrade

D_FILE_NAME="go.linux-amd64.tar.gz"
W_DIR=$HOME/go_project

# download and rename
wget -c https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz -O $D_FILE_NAME

# extract and move
sudo tar -xvf $D_FILE_NAME
sudo mv go /usr/local

# setting up Go Enviroment
echo "export GOROOT=/usr/local/go" >> ~/.bashrc

mkdir -p $W_DIR
echo "export GOPATH=$HOME/$W_DIR" >> ~/.bashrc

echo "export PATH=$GOPATH/bin:$GOROOT/bin:$PATH" >> ~/.bashrc

# ------
echo "go is now installed. You can verify your connection using the following commands"
echo "go version"
echo "go env"
