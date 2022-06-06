# Cool things
sudo apt update && sudo apt upgrade -y
sudo apt install vlc gimp gparted synaptic -y
sudo apt install ubuntu-restricted-extras -y
sudo apt install timeshift -y
sudo apt install preload -y
sudo apt install bleachbit -y
sudo apt install htop -y

# Nvidia Driver
sudo apt install nvidia-driver-510 nvidia-dkms-510 -y

# OpenCV
sudo apt update -y
sudo apt install libopencv-dev python3-opencv -y

# Gazebo
sudo apt install curl -y
curl -sSL http://get.gazebosim.org | sh

# ROS2
apt-cache policy | grep universe
 500 http://us.archive.ubuntu.com/ubuntu jammy/universe amd64 Packages
     release v=22.04,o=Ubuntu,a=jammy,n=jammy,l=Ubuntu,c=universe,b=amd64
sudo apt install software-properties-common -y
sudo add-apt-repository universe -y
sudo apt update && sudo apt install curl gnupg lsb-release -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update && sudo apt upgrade
sudo apt install ros-rolling-desktop -y && sudo apt install ros-rolling-ros-base -y
source /opt/ros/rolling/setup.bash 

# bashrc 
rm ~/.tmp-bashrc
cat ~/.bashrc >> ~/.tmp-bashrc
echo '' >> ~/.tmp-bashrc 
echo '# ROS2' >> ~/.tmp-bashrc 
echo 'source /opt/ros/rolling/setup.bash ' >> ~/.tmp-bashrc 
cat ~/.tmp-bashrc > ~/.bashrc 
rm ~/.tmp-bashrc

# PX4
cd ~/Documents
git clone https://github.com/PX4/PX4-Autopilot.git --recursive
bash ./PX4-Autopilot/Tools/setup/ubuntu.sh --no-nuttx

# Download https://d176tv9ibo4jno.cloudfront.net/builds/master/QGroundControl.AppImage

# Fast-DDS
# Foonathan memory
cd ~/Documents
git clone https://github.com/eProsima/foonathan_memory_vendor.git
cd foonathan_memory_vendor
mkdir build && cd build
cmake ..
sudo cmake --build . --target install

# Fast DDS
cd ~/Documents
git clone --recursive https://github.com/eProsima/Fast-DDS.git -b v2.4.2
cd Fast-DDS/
mkdir build && cd build
cmake -DTHIRDPARTY=ON -DSECURITY=ON ..
make -j$(nproc)
sudo make install

# Fast-RTPS-Gen
cd ~/Documents
sudo apt install gradle -y
git clone --recursive https://github.com/eProsima/Fast-DDS-Gen.git -b v1.0.4 
cd Fast-RTPS-Gen/
./gradlew assemble
sudo env "PATH=$PATH" ./gradlew install

# PX4-ROS 2 Bridge
cd ~/Documents
sudo apt install python3-colcon-common-extensions
sudo apt install ros-rolling-eigen3-cmake-module
sudo pip3 install -U empy pyros-genmsg setuptools
mkdir -p px4_ros_com_ros2/src
git clone https://github.com/PX4/px4_ros_com.git px4_ros_com_ros2/src/px4_ros_com
git clone https://github.com/PX4/px4_msgs.git px4_ros_com_ros2/src/px4_msgs
cd ~/Documents/px4_ros_com_ros2/src/px4_ros_com/scripts
./build_ros2_workspace.bash --verbose --ros_distro=rolling --ros_path /opt/ros/rolling/setup.bash --verbose
