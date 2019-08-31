# My Common Shell Scripts
This repository contains certain shell scripts written to install a few robotics packages on ubuntu 16.04

## To Install the Baxter Simulator on ROS kinetic

```
# Download and install the sim

wget https://raw.githubusercontent.com/chibike/shell_scripts/master/install_baxter_sim_kinetic.sh
chmod +x install_baxter_sim_kinetic.sh
./install_baxter_sim_kinetic.sh


# Customize the baxter.sh script

cd ~/baxter_ws/
nano baxter.sh
```

#### Update the your_ip field

Change from

your_ip="192.168.XXX.XXX"


To

your_ip="127.0.0.1"




Change from

ros_version="indigo"


To

ros_version="kinetic"

#### Test Installation

```
# In a new terminal

cd ~/baxter_ws/
./baxter.sh sim
roslaunch baxter_gazebo baxter_world.launch


# In a different terminal

cd ~/baxter_ws/
./baxter.sh sim
rosrun baxter_tools tuck_arms.py -u
```

## To Setup Your Ubuntu 16.04 for DL with OpenCV3 follow the instructions below (for python2 and python3)

```
wget https://raw.githubusercontent.com/chibike/shell_scripts/master/setup_ubuntu16_4_dl_py2py3.sh
chmod +x setup_ubuntu16_4_dl_py2py3.sh
sudo ./setup_ubuntu16_4_dl_py2py3.sh
```

## To Install OpenCV2 (only) on Your Ubuntu 16.04 follow the instructions below (for python2 and python3)

```
wget https://raw.githubusercontent.com/chibike/shell_scripts/master/install_opencv3_4dl_py2py3_ubuntu16.sh
chmod +x install_opencv3_4dl_py2py3_ubuntu16.sh
sudo ./install_opencv3_4dl_py2py3_ubuntu16.sh
```


## .bashrc Modifications

#### [For pwd replaced with git project/directory name shortcut](#)
replace
```
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
```

with
```
parse_git_branch() {
             git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
     }
if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\W:\$ '
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W$(parse_git_branch)\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
```
