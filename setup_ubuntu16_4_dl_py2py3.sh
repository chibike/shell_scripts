#!/bin/bash

if [ "$EUID" -ne 0 ]
    then echo "Please run as root"
    exit
fi

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

printf "\n${ORANGE}Configuring Ubuntu for deep learning with Python${NC}"
printf "\nby ${GREEN}Chibuike Okpaluba${NC}"
printf "\nusing the blog post @ ${RED}https://www.pyimagesearch.com/2017/09/25/configuring-ubuntu-for-deep-learning-with-python/${NC}"

printf "\n"

printf "\nThis install is broken down into 4 sections"
printf "\n  1. Install Ubuntu system dependencies"
printf "\n  2. Create your python 3 virtual environment"
printf "\n  3. Compile and install OpenCV"
printf "\n  4. install keras"

printf "\n"


printf "\n\nUpdating your operating system"
sudo apt-get update
sudo apt-get upgrade

printf "\n\nInstalling essential packages\n"
sudo apt-get install build-essential cmake git unzip pkg-config
sudo apt-get install libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install libxvidcore-dev libx264-dev
sudo apt-get install libgtk-3-dev
sudo apt-get install libhdf5-serial-dev graphviz
sudo apt-get install libopenblas-dev libatlas-base-dev gfortran
sudo apt-get install python-tk python3-tk python-imaging-tk

printf "\n\nInstalling opencv\n"
cd ~
wget https://raw.githubusercontent.com/chibike/shell_scripts/master/install_opencv3_4dl_py2py3_ubuntu16.sh
chmod +x install_opencv3_4dl_py2py3_ubuntu16.sh
sudo ./install_opencv3_4dl_py2py3_ubuntu16.sh

#printf "\n\n\n${RED}Testing OpenCV${NC}"
#python -c "import cv2; print(cv2.__version__)"
#printf "\n\nyou should see the installed opencv version above\n\n\n"

printf "\n\nInstalling Keras\n"
sudo -H pip2 install --user --upgrade scipy matplotlib pillow imutils h5py requests progressbar2 scikit-learn scikit-image tensorflow tensorflow-gpu keras
sudo -H pip3 install --user --upgrade numpy scipy matplotlib pillow imutils h5py requests progressbar2 scikit-learn scikit-image tensorflow tensorflow-gpu keras

#pip install scipy matplotlib pillow
#pip install imutils h5py requests progressbar2
#pip install scikit-learn scikit-image
#pip install tensorflow
#pip install keras

#printf "\n\n\n${RED}Testing Keras${NC}"
#python -c "import keras; print(\"install successful\")"
#printf "\n\nyou should see the quote ${RED}\"install successful\"${NC} above\n\n\n"


printf "\n\n\n${RED}Before${NC} you wrap up, take a second to "
printf "familiarize yourself with the ${RED}~/.keras/keras.json${NC} file"

printf "${GREEN}\n"
printf "{\n"
printf "	\"image_data_format\": \"channels_last\",\n"
printf "	\"backend\": \"tensorflow\",\n"
printf "	\"epsilon\": ${RED}1e-07${GREEN},\n"
printf "	\"floatx\": \"float32\"\n"
printf "}\n"
printf "${NC}\n\n"


printf "\n\nDone!\n"
exit
