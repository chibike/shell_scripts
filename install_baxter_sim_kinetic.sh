#!/bin/bash

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

printf "\n${ORANGE}Installing the Baxter Simulator${NC}"
printf "\nby ${GREEN}Chibuike Okpaluba${NC}"
printf "\nUsing the blog post @ ${RED}http://sdk.rethinkrobotics.com/wiki/Simulator_Installation/${NC}"

printf "\n"

BAXTER_WS='baxter_ws'

mkdir -p ~/$BAXTER_WS/src
cd ~/$BAXTER_WS
catkin_make
catkin_make install

sudo apt-get update
sudo apt-get install git-core python-argparse python-wstool python-vcstools python-rosdep ros-kinetic-control-msgs ros-kinetic-joystick-drivers

cd ~/$BAXTER_WS/src
wstool init .
wstool merge https://raw.githubusercontent.com/RethinkRobotics/baxter/master/baxter_sdk.rosinstall
wstool update

cd ~/$BAXTER_WS
catkin_make
catkin_make install

cd ~/$BAXTER_WS
wget https://github.com/RethinkRobotics/baxter/raw/master/baxter.sh
chmod u+x baxter.sh

sudo apt-get install gazebo7 ros-kinetic-qt-build ros-kinetic-gazebo-ros-control ros-kinetic-gazebo-ros-pkgs ros-kinetic-ros-control ros-kinetic-control-toolbox ros-kinetic-realtime-tools ros-kinetic-ros-controllers ros-kinetic-xacro python-wstool ros-kinetic-tf-conversions ros-kinetic-kdl-parser
cd ~/$BAXTER_WS/src
wstool merge https://raw.githubusercontent.com/RethinkRobotics/baxter_simulator/kinetic-devel/baxter_simulator.rosinstall
wstool update

cd ~/$BAXTER_WS
catkin_make

printf "\n${GREEN}Customize the baxter.sh script${NC}\n"
printf "\n${ORANGE}nano ~/$BAXTER_WS/baxter.sh${NC}\n"

printf "\n${GREEN}Edit the ${RED}baxter_hostname${GREEN} field${NC}\n"
printf "\n${ORANGE}**baxter_hostname=${RED}baxter_hostname.local${ORANGE}**${NC}\n"

printf "\n${GREEN}Edit the ${RED}your_ip${GREEN} field${NC}\n"
printf "\n${ORANGE}**your_ip=${RED}192.168.XXX.XXX${ORANGE}**${NC}\n"

printf "\n${GREEN}Verify the ${RED}ros_version${GREEN} field${NC}\n"
printf "\n${ORANGE}***ros_version=${RED}kinetic${ORANGE}**${NC}\n"

printf "\n\n${GREEN}Test Using${NC}\n"
printf "\n${ORANGE}./baxter.sh sim${NC}\n"
printf "\n${ORANGE}roslaunch baxter_gazebo baxter_world.launch${NC}\n"


printf "\n\n${GREEN}If you loved it please show some love to the author @ ${ORANGE}https://linkedin.com/in/chibike/${GREEN}${NC}\n"
printf "\nThank you\n"




