#!/bin/bash

cd `dirname $0`

# xhost +
xhost +local:user
if [ ! -e /home/${USER}/.gazebo ]; then
    mkdir /home/${USER}/.gazebo
fi

# other pc
docker run -it \
--privileged \
--runtime=nvidia  --gpus all \
-e NVIDIA_VISIBLE_DEVICES=all \
-e NVIDIA_DRIVER_CAPABILITIES=all \
-e __NV_PRIME_RENDER_OFFLOAD=1 \
-e __GLX_VENDOR_LIBRARY_NAME=nvidia \
--env=DISPLAY=$DISPLAY \
--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
-v "/home/${USER}/.Xauthority:/home/${USER}/.Xauthority" \
--env="QT_X11_NO_MITSHM=1" \
--rm \
-v "/$(pwd)/global_ros_setting.sh:/ros_setting.sh" \
-v "/$(pwd)/ros_workspace:/home/${USER}/catkin_ws/" \
-v "/$(pwd)/../robot_simulator_template:/home/${USER}/catkin_ws/src/robot_simulator_template" \
-v "/$(pwd)/../third_party:/home/${USER}/catkin_ws/src/third_party" \
-v "/home/${USER}/.gazebo:/home/${USER}/.gazebo" \
-v /etc/group:/etc/group:ro \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/localtime:/etc/localtime:ro \
-v /media:/media \
-v /dev:/dev \
--net host \
${USER}/simulator_template
