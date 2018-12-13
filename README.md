## shell_scripts
contains shell scripts for some install tasks

### To Setup Your Ubuntu 16.04 for DL with OpenCV3 follow the instructions below (for python2 and python3)
1. wget https://raw.githubusercontent.com/chibike/shell_scripts/master/setup_ubuntu16_4_dl_py2py3.sh
2. chmod +x setup_ubuntu16_4_dl_py2py3.sh
3. sudo ./setup_ubuntu16_4_dl_py2py3.sh

## To Install OpenCV2 (only) on Your Ubuntu 16.04 follow the instructions below (for python2 and python3)
1. wget https://raw.githubusercontent.com/chibike/shell_scripts/master/install_opencv3_4dl_py2py3_ubuntu16.sh
2. chmod +x install_opencv3_4dl_py2py3_ubuntu16.sh
3. sudo ./install_opencv3_4dl_py2py3_ubuntu16.sh

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

###### Edit the your_ip field
###### **your_ip=192.168.XXX.XXX** to **your_ip=127.0.0.1**
###### ***ros_version=kinetic**

### Test Using

```
# In a new terminal
cd ~/baxter_ws/
./baxter.sh sim; roslaunch baxter_gazebo baxter_world.launch

# In a different terminal
cd ~/baxter_ws/
./baxter.sh sim; rosrun baxter_tools tuck_arms.py -u
```
