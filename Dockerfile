FROM ros:noetic

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies for X11 apps (and other general stuff)
RUN apt-get update && apt-get install -y \
    mesa-utils \
    libgl1-mesa-dri \
    libgl1 \
    x11-apps

# Install build dependencies
RUN apt-get update && apt-get install -y \
    python3-catkin-tools \
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool \
    build-essential

# Install RViz + GUI tools
RUN apt-get update && apt-get install -y \
        ros-noetic-rviz \
        ros-noetic-rqt-gui \
        ros-noetic-rqt-common-plugins

# Install other message packages you'd like here
# This saves you needing to compile them at runtime
# RUN apt-get update && apt-get install -y \
#         ros-noetic-MESSAGES1 \
#         ros-noetic-MESSAGE2 \
#         ros-noetic-MESSAGE3

# Create workspace for messages, data, etc.
RUN mkdir -p /tmp/runtime-root
RUN mkdir -p /data
RUN mkdir -p /root/ros1_ws/src
WORKDIR /root/ros1_ws

# Set up ROS environment
RUN echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc
RUN echo "source /root/ros1_ws/devel/setup.bash" >> /root/.bashrc
ENV DISABLE_ROS1_EOL_WARNINGS=1

# Entrypoint for automatically compiling workspace
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

# Default to running bash
CMD ["/bin/bash"]
