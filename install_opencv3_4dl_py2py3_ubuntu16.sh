# Update packages
sudo apt-get update
sudo apt-get upgrade


# Install OS libraries
#Remove any previous installations of x264</h3>
sudo apt-get remove x264 libx264-dev

#We will Install dependencies now
sudo apt-get install build-essential checkinstall cmake pkg-config yasm
sudo apt-get install git gfortran
sudo apt-get install libjpeg8-dev libjasper-dev libpng12-dev
sudo apt-get install libtiff5-dev

sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
sudo apt-get install libxine2-dev libv4l-dev
sudo apt-get install libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
sudo apt-get install qt5-default libgtk2.0-dev libtbb-dev
sudo apt-get install libatlas-base-dev
sudo apt-get install libfaac-dev libmp3lame-dev libtheora-dev
sudo apt-get install libvorbis-dev libxvidcore-dev
sudo apt-get install libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt-get install x264 v4l-utils


# Optional dependencies
sudo apt-get install libprotobuf-dev protobuf-compiler
sudo apt-get install libgoogle-glog-dev libgflags-dev
sudo apt-get install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

# Install Python libraries
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo -H pip2 install -U pip numpy
sudo -H pip3 install -U pip numpy

sudo -H pip2 install numpy scipy matplotlib scikit-image scikit-learn ipython
sudo -H pip3 install numpy scipy matplotlib scikit-image scikit-learn ipython

sudo -H pip2 install virtualenv virtualenvwrapper
sudo -H pip3 install virtualenv virtualenvwrapper

echo "# Virtual Environment Wrapper"  >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
source ~/.bashrc

############ For Python 2 ############
# create virtual environment
mkvirtualenv dl_py2 -p python2
workon dl_py2

# install dependencies
pip install numpy scipy matplotlib scikit-image scikit-learn ipython

# quit virtual environment
deactivate

############ For Python 3 ############
# create virtual environment
mkvirtualenv dl_py3 -p python3
workon dl_py3

# install dependencies
pip install numpy scipy matplotlib scikit-image scikit-learn ipython

# quit virtual environment
deactivate

#Download opencv from Github
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout 3.3.1
cd ..

git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout 3.3.1
cd ..

# Compile and install OpenCV with contrib modules
# Create a build directory
cd opencv
mkdir build
cd build

# Run CMake
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON ..

# Compile and Install
# find out number of CPU cores in your machine
#nproc
#make -j4

# substitute 4 by output of nproc
mkcmd=`echo "make -j\`nproc\`"`
eval $mkcmd

sudo make install
sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig

cd ~/.virtualenvs/dl_py2/lib/python2.7/site-packages
ln -s /usr/local/lib/python2.7/dist-packages/cv2.so cv2.so

cd /usr/local/lib/python3.5/dist-packages/
sudo ln -s /usr/local/lib/python3.5/dist-packages/cv2.cpython-35m-x86_64-linux-gnu.so cv2.so

cd ~/.virtualenvs/dl_py3/lib/python3.5/site-packages
#ln -s /usr/local/lib/python3.5/dist-packages/cv2.cpython-35m-x86_64-linux-gnu.so cv2.so
ln -s /usr/local/lib/python3.5/dist-packages/cv2.so cv2.so


#Step 5.4: Create symlink in virtual environment

#Depending upon Python version you have, paths would be different. OpenCV’s Python binary (cv2.so) can be installed either in directory site-packages or dist-packages. Use the following command to #find out the correct location on your machine.

#find /usr/local/lib/ -type f -name "cv2*.so"
#It should output paths similar to one of these (or two in case OpenCV was compiled for both Python2 and Python3):

############ For Python 2 ############
## binary installed in dist-packages
#/usr/local/lib/python2.6/dist-packages/cv2.so
#/usr/local/lib/python2.7/dist-packages/cv2.so
## binary installed in site-packages
#/usr/local/lib/python2.6/site-packages/cv2.so
#/usr/local/lib/python2.7/site-packages/cv2.so
  
############ For Python 3 ############
## binary installed in dist-packages
#/usr/local/lib/python3.5/dist-packages/cv2.cpython-35m-x86_64-linux-gnu.so
#/usr/local/lib/python3.6/dist-packages/cv2.cpython-36m-x86_64-linux-gnu.so
## binary installed in site-packages
#/usr/local/lib/python3.5/site-packages/cv2.cpython-35m-x86_64-linux-gnu.so
#/usr/local/lib/python3.6/site-packages/cv2.cpython-36m-x86_64-linux-gnu.so

#Double check the exact path on your machine before running the following 
