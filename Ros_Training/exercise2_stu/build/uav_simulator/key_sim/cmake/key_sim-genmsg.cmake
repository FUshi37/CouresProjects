# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "key_sim: 0 messages, 1 services")

set(MSG_I_FLAGS "-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(key_sim_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/yangzhe/exercise2_stu/src/uav_simulator/key_sim/srv/lec4.srv" NAME_WE)
add_custom_target(_key_sim_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "key_sim" "/home/yangzhe/exercise2_stu/src/uav_simulator/key_sim/srv/lec4.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(key_sim
  "/home/yangzhe/exercise2_stu/src/uav_simulator/key_sim/srv/lec4.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/key_sim
)

### Generating Module File
_generate_module_cpp(key_sim
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/key_sim
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(key_sim_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(key_sim_generate_messages key_sim_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yangzhe/exercise2_stu/src/uav_simulator/key_sim/srv/lec4.srv" NAME_WE)
add_dependencies(key_sim_generate_messages_cpp _key_sim_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(key_sim_gencpp)
add_dependencies(key_sim_gencpp key_sim_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS key_sim_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(key_sim
  "/home/yangzhe/exercise2_stu/src/uav_simulator/key_sim/srv/lec4.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/key_sim
)

### Generating Module File
_generate_module_eus(key_sim
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/key_sim
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(key_sim_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(key_sim_generate_messages key_sim_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yangzhe/exercise2_stu/src/uav_simulator/key_sim/srv/lec4.srv" NAME_WE)
add_dependencies(key_sim_generate_messages_eus _key_sim_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(key_sim_geneus)
add_dependencies(key_sim_geneus key_sim_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS key_sim_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(key_sim
  "/home/yangzhe/exercise2_stu/src/uav_simulator/key_sim/srv/lec4.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/key_sim
)

### Generating Module File
_generate_module_lisp(key_sim
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/key_sim
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(key_sim_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(key_sim_generate_messages key_sim_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yangzhe/exercise2_stu/src/uav_simulator/key_sim/srv/lec4.srv" NAME_WE)
add_dependencies(key_sim_generate_messages_lisp _key_sim_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(key_sim_genlisp)
add_dependencies(key_sim_genlisp key_sim_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS key_sim_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(key_sim
  "/home/yangzhe/exercise2_stu/src/uav_simulator/key_sim/srv/lec4.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/key_sim
)

### Generating Module File
_generate_module_nodejs(key_sim
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/key_sim
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(key_sim_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(key_sim_generate_messages key_sim_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yangzhe/exercise2_stu/src/uav_simulator/key_sim/srv/lec4.srv" NAME_WE)
add_dependencies(key_sim_generate_messages_nodejs _key_sim_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(key_sim_gennodejs)
add_dependencies(key_sim_gennodejs key_sim_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS key_sim_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(key_sim
  "/home/yangzhe/exercise2_stu/src/uav_simulator/key_sim/srv/lec4.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/key_sim
)

### Generating Module File
_generate_module_py(key_sim
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/key_sim
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(key_sim_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(key_sim_generate_messages key_sim_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yangzhe/exercise2_stu/src/uav_simulator/key_sim/srv/lec4.srv" NAME_WE)
add_dependencies(key_sim_generate_messages_py _key_sim_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(key_sim_genpy)
add_dependencies(key_sim_genpy key_sim_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS key_sim_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/key_sim)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/key_sim
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(key_sim_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(key_sim_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/key_sim)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/key_sim
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(key_sim_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(key_sim_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/key_sim)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/key_sim
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(key_sim_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(key_sim_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/key_sim)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/key_sim
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(key_sim_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(key_sim_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/key_sim)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/key_sim\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/key_sim
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(key_sim_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(key_sim_generate_messages_py std_msgs_generate_messages_py)
endif()
