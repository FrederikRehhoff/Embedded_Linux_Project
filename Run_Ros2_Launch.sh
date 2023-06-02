#!/bin/bash

# Change to the directory where your ROS 2 workspace is located
cd ~/Embedded_Linux_Project/ros2_ws

# Source the ROS 2 setup script
source /opt/ros/humble/setup.bash

# Source your workspace setup script
source install/setup.bash

# Run the ros2 launch command
ros2 launch emli_package emli.launch.py
