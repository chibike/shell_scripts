#!/bin/bash

# where to get instructuions online
echo "https://kubernetes.io/docs/tasks/tools/install-kubectl/"

# Before you begin
# You must use a kubectl version that is within one minor version
# difference of your cluster. For example, a v1.2 client should work with v1.1, v1.2, and v1.3 master.
# Using the latest version of kubectl helps avoid unforeseen issues

echo "installing kubectl on Linux using curl"
# To download a specific version, replace the
# $(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt) portion of the command with the specific version.

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version

# echo "installing using apt"
# sudo apt-get update && sudo apt-get install -y apt-transport-https
# curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
# sudo apt-get update
# sudo apt-get install -y kubectl

