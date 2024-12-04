cmake_minimum_required(VERSION 3.0.2)
project(lab1)
## Find dependencies
find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  roscpp
  rospy
  std_srvs
  turtlesim
  nav_msgs
)

###################################
## catkin specific configuration ##
###################################
catkin_package(
 CATKIN_DEPENDS geometry_msgs roscpp rospy std_srvs turtlesim
)

###########
## Build ##
###########

include_directories(
  ${catkin_INCLUDE_DIRS}
)

## C++ examples
add_executable(lab1_node src/lab1_node.cpp)
target_link_libraries(lab1_node ${catkin_LIBRARIES})

################
## No Install ##
################
