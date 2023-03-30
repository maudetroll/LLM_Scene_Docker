#!/bin/sh
uid=$(eval "id -u")
gid=$(eval "id -g")
docker build --build-arg UID="$uid" --build-arg GID="$gid" --build-arg ROS_DISTRO=foxy --build-arg DOMAIN_ID=7 -t iras/r2e:foxy .
echo "Run Container"
docker run --name r2e_cell --privileged -it -e DISPLAY=$DISPLAY -v $PWD/src:/home/robot/ros_ws/src:rw --net host --rm --ipc host iras/r2e:foxy