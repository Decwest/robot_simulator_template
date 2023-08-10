# robot_simulator_template
This repository contains some urdfs of robot components for robot simulation in gazebo.
You can construct your original robot by creating xacro file including these components, like `robot_simulator_template/model/robot/example.xacro`.

## Docker environment
This repository also contains a docker environment to check the xacro model in gazebo.
**How to install:**

1. Clone
```shell
git clone --recursive https://github.com/Decwest/robot_simulator_template.git
```
2. Build docker image
```shell
cd robot_simulator_template/docker
./build.sh
```
3. Launch docker container
```shell
cd robot_simulator_template/docker
./run.sh
SIMULATOR$ catkin build
SIMULATOR$ source devel/setup.bash
```
4. Launch simulator
```shell
SIMULATOR$ roslaunch robot_simulator_template simulation.launch
```

