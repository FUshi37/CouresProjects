project(key_sim)
cmake_minimum_required(VERSION 3.1)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR})
find_package(catkin REQUIRED COMPONENTS
    std_msgs
    actionlib_msgs
    message_generation
    )

#add_action_files(
#    DIRECTORY action
#    FILES
#    lec4.action
#)


 add_service_files(
     DIRECTORY srv
     FILES
     lec4.srv
 )

generate_messages(
    DEPENDENCIES
    actionlib_msgs
    std_msgs
)

catkin_install_python(PROGRAMS scripts/key_sim.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

catkin_package()
