# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/yangzhe/exercise2/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yangzhe/exercise2/build

# Utility rule file for clean_test_results_uav_utils.

# Include the progress variables for this target.
include uav_simulator/Utils/uav_utils/CMakeFiles/clean_test_results_uav_utils.dir/progress.make

uav_simulator/Utils/uav_utils/CMakeFiles/clean_test_results_uav_utils:
	cd /home/yangzhe/exercise2/build/uav_simulator/Utils/uav_utils && /usr/bin/python3 /opt/ros/noetic/share/catkin/cmake/test/remove_test_results.py /home/yangzhe/exercise2/build/test_results/uav_utils

clean_test_results_uav_utils: uav_simulator/Utils/uav_utils/CMakeFiles/clean_test_results_uav_utils
clean_test_results_uav_utils: uav_simulator/Utils/uav_utils/CMakeFiles/clean_test_results_uav_utils.dir/build.make

.PHONY : clean_test_results_uav_utils

# Rule to build all files generated by this target.
uav_simulator/Utils/uav_utils/CMakeFiles/clean_test_results_uav_utils.dir/build: clean_test_results_uav_utils

.PHONY : uav_simulator/Utils/uav_utils/CMakeFiles/clean_test_results_uav_utils.dir/build

uav_simulator/Utils/uav_utils/CMakeFiles/clean_test_results_uav_utils.dir/clean:
	cd /home/yangzhe/exercise2/build/uav_simulator/Utils/uav_utils && $(CMAKE_COMMAND) -P CMakeFiles/clean_test_results_uav_utils.dir/cmake_clean.cmake
.PHONY : uav_simulator/Utils/uav_utils/CMakeFiles/clean_test_results_uav_utils.dir/clean

uav_simulator/Utils/uav_utils/CMakeFiles/clean_test_results_uav_utils.dir/depend:
	cd /home/yangzhe/exercise2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yangzhe/exercise2/src /home/yangzhe/exercise2/src/uav_simulator/Utils/uav_utils /home/yangzhe/exercise2/build /home/yangzhe/exercise2/build/uav_simulator/Utils/uav_utils /home/yangzhe/exercise2/build/uav_simulator/Utils/uav_utils/CMakeFiles/clean_test_results_uav_utils.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : uav_simulator/Utils/uav_utils/CMakeFiles/clean_test_results_uav_utils.dir/depend
