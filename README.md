
# ROS1 Noetic RVIZ Docker Container

Dockerfile for starting `rviz` so that ROS1 topics can be visualised on non-ROS1 supported systems.

## Usage
Once docker is installer, start the rviz via 
```
./run.sh
```

> [!WARNING]
> **Warning:** Closing `rviz` will kill the container.
This makes it easier for you to get started, but if you want other behaviours, I can sit down and work through those with you.

### Mounting Volumes
- Any data (`.bag` files) placed in `./data` will be mounted into the container so they're easy to use 
- Any packages (suggesting message packages) placed in `./msgs` will be mounted into the container.  On container bringup, dependencies will be imported using `rosdep`, the workspace will be built sourced before starting rviz.

## Other Commands
### Attach to the container
To attach to the container and get a bash terminal (for example, to play a bag), run

```bash
docker exec -it ros1_noetic bash
```

### Bring down the container
The container should automatically close itself when `rviz` is closed.
If not, from this folder, run

```bash
docker compose down
```

## Debugging
### X11 Issues
- Check `xeyes` works by running `xeyes` from within the container.