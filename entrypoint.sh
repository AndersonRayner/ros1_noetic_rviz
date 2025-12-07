#!/bin/bash
set -e

# Source ROS1 install
source /opt/ros/noetic/setup.bash

# cd to workspace
cd /root/ros1_ws

# Install any rosdep deps
rosdep install --from-paths src -y --ignore-src

# Compile workspace
catkin init
catkin build
source devel/setup.bash

# Start a roscore
roscore
exit 0

# If you just want rviz to start up, uncomment the 
# above section (`roscore` and `exit 0`), and let it run through 
# to this part
roscore &
sleep 2

# Start rviz
rviz
