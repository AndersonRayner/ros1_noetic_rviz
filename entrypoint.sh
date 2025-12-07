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

# Start a roscore (and wait for it to boot)
roscore &
sleep 2

# Start rviz
rviz
