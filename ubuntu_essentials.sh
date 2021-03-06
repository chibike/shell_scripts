#!/bin/bash

sudo apt-get update
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget
sudo apt install software-properties-common apt-transport-https
sudo apt-get install git-core
sudo apt install python3.6 python3-pip

pip3 install virtualenv virtualenvwrapper
pip3 install numpy scipy matplotlib
