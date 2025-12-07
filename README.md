
# ROS1 Noetic X11 Docker Container

Dockerfile for starting a ROS1 roscore with X11 forwarding so standard ROS1 tools (such as `rviz`) can be visualised on non-ROS1 supported systems.

## Usage
Once docker is installer, start the container via 
```
./run.sh
```

This starts a basic `roscore`, then you can attach to the container (commands below) to run `rviz`, or whatever else you'd like.

### Mounting Volumes
- Any data (`.bag` files) placed in `./data` will be mounted into the container so they're easy to use 
- Any packages (suggesting message packages) placed in `./msgs` will be mounted into the container.  On container bringup, dependencies will be imported using `rosdep`, the workspace will be built sourced before starting rviz.

## Other Commands
### Attach to the container
To attach to the container and get a bash terminal (for example, to play a bag), run

```bash
docker exec -it ros1_noetic bash
```

From here, you'll be able to run all the standard `ros1` commands such as `rviz`.

### Bring down the container
The container should automatically close itself when the `roscore` terminal is closed.
If not (likely the container was started in daemon mode (`-d`)), from this folder, run

```bash
docker compose down
```

## Debugging
### X11 Issues
- Check `xeyes` works by running `xeyes` from within the container.
- Check `X11` is being used (not `wayland`) using `echo $XDG_SESSION_TYPE`
