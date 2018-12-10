#!/bin/bash

#if [ "$EUID" -ne 0 ]
#    then echo "Please run as root"
#    exit
#fi

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
NC='\033[0m'

printf "\n${ORANGE}Configuring Your Ubuntu for robot navigation with ROS${NC}"
printf "\nby ${GREEN}Chibuike Okpaluba${NC}"
printf "\nusing the wiki post @ ${RED}http://wiki.ros.org/kinetic/Installation/Ubuntu/${NC}"

printf "\n"

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update

sudo apt-get install ros-kinetic-desktop-full
apt-cache search ros-kinetic
sudo rosdep init
rosdep update

echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

source /opt/ros/kinetic/setup.bash

sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential

mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin_make

echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo rosdep fix-permissions

sudo apt-get install ros-kinetic-turtlebot ros-kinetic-turtlebot-apps ros-kinetic-turtlebot-interactions ros-kinetic-turtlebot-simulator ros-kinetic-kobuki-ftdi ros-kinetic-ar-track-alvar-msgs
sudo apt-get install python-rosdep python-wstool
rosdep update


sudo apt-get install -y linux-headers-generic
sudo sh -c 'echo "deb-src http://us.archive.ubuntu.com/ubuntu/ xenial main restricted
deb-src http://us.archive.ubuntu.com/ubuntu/ xenial-updates main restricted
deb-src http://us.archive.ubuntu.com/ubuntu/ xenial-backports main restricted universe multiverse
deb-src http://security.ubuntu.com/ubuntu xenial-security main restricted" > /etc/apt/sources.list.d/official-source-repositories.list'
sudo apt-get update
sudo apt-get install -y ros-kinetic-librealsense
sudo apt-get install -y ros-kinetic-librealsense-camera
sudo apt-get install -y ros-kinetic-turtlebot

echo "#export ROS_MASTER_URI=http://192.168.100.103:11311/" >> ~/.bashrc
echo "#export ROS_HOSTNAME=192.168.100.100" >> ~/.bashrc
echo "#export ROS_IP=192.168.100.100" >> ~/.bashrc

echo "#alias cd_ws='cd ~/catkin_ws/src'" >> ~/.bashrc
echo "#alias mk_ws='cd ~/catkin_ws & catkin_make'" >> ~/.bashrc

source ~/.bashrc

sudo rosdep fix-permissions

source ~/.bashrc


printf "\n\nDone!\n"
exit
