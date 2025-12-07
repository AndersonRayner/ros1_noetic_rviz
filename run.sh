#!/bin/bash
set -e

# Allow X11 forwarding
xhost +local:docker

# Bring up docker container and launch `rviz`
# If nothing is changing in the dockerfile, you can omit `--build`
docker compose up --build
