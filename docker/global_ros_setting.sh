#!/bin/bash

## source 
source ~/catkin_ws/devel/setup.bash
## get ipv4 address
ipv4addr=$(/sbin/ifconfig -a                                 |
            grep inet[^6]                                     |
            sed 's/.*inet[^6][^0-9]*\([0-9.]*\)[^0-9]*.*/\1/' |
            grep '^192\.168\.1\.'                                )

CATKIN_HOME=~/catkin_ws

export ROS_HOME=~/.ros
export GAZEBO_MODEL_DATABASE_URI=http://models.gazebosim.org/

echo "HOSTNAME : "$HOSTNAME

TARGET_IP=$ipv4addr
if [ -z "$TARGET_IP" ] ; then
    echo "ROS_IP is not set."
else
    export ROS_IP=$TARGET_IP
fi
if [ "$ipv4addr" = "" ] ; then
    ipv4addr="localhost"
fi
TARGET_IP=$ipv4addr
echo "ROS_MASER : LOCAL" 
export ROS_MASTER_URI=http://$TARGET_IP:11311
## alias
cdls()
{
    \cd "$@" && ls
}
alias cd="cdls"
alias cm="cd ${CATKIN_HOME} && catkin build && cd -"
alias cc="cd ${CATKIN_HOME} && rm -rf devel && rm -rf build && rm -rf logs && cd -"

## echo
echo "ROS_IP:"$ROS_IP
echo "ROS_MASTER_URI:"$ROS_MASTER_URI
echo "==========================="
echo "=LOADED GLOBAL ROS SETTING="
echo "==========================="

