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

# Include any dependencies generated for this target.
include uav_simulator/Utils/uav_utils/CMakeFiles/uav_utils-test.dir/depend.make

# Include the progress variables for this target.
include uav_simulator/Utils/uav_utils/CMakeFiles/uav_utils-test.dir/progress.make

# Include the compile flags for this target's objects.
include uav_simulator/Utils/uav_utils/CMakeFiles/uav_utils-test.dir/flags.make

uav_simulator/Utils/uav_utils/CMakeFiles/uav_utils-test.dir/src/uav_utils_test.cpp.o: uav_simulator/Utils/uav_utils/CMakeFiles/uav_utils-test.dir/flags.make
uav_simulator/Utils/uav_utils/CMakeFiles/uav_utils-test.dir/src/uav_utils_test.cpp.o: /home/yangzhe/exercise2/src/uav_simulator/Utils/uav_utils/src/uav_utils_test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yangzhe/exercise2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object uav_simulator/Utils/uav_utils/CMakeFiles/uav_utils-test.dir/src/uav_utils_test.cpp.o"
	cd /home/yangzhe/exercise2/build/uav_simulator/Utils/uav_utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/uav_utils-test.dir/src/uav_utils_test.cpp.o -c /home/yangzhe/exercise2/src/uav_simulator/Utils/uav_utils/src/uav_utils_test.cpp

uav_simulator/Utils/uav_utils/CMakeFiles/uav_utils-test.dir/src/uav_utils_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/uav_utils-test.dir/src/uav_utils_test.cpp.i"
	cd /home/yangzhe/exercise2/build/uav_simulator/Utils/uav_utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yangzhe/exercise2/src/uav_simulator/Utils/uav_utils/src/uav_utils_test.cpp > CMakeFiles/uav_utils-test.dir/src/uav_utils_test.cpp.i

uav_simulator/Utils/uav_utils/CMakeFiles/uav_utils-test.dir/src/uav_utils_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/uav_utils-test.dir/src/uav_utils_test.cpp.s"
	cd /home/yangzhe/exercise2/build/uav_simulator/Utils/uav_utils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yangzhe/exercise2/src/uav_simulator/Utils/uav_utils/src/uav_utils_test.cpp -o CMakeFiles/uav_utils-test.dir/src/uav_utils_test.cpp.s

# Object files for target uav_utils-test
uav_utils__test_OBJECTS = \
"CMakeFiles/uav_utils-test.dir/src/uav_utils_test.cpp.o"

# External object files for target uav_utils-test
uav_utils__test_EXTERNAL_OBJECTS =

/home/yangzhe/exercise2/devel/lib/uav_utils/uav_utils-test: uav_simulator/Utils/uav_utils/CMakeFiles/uav_utils-test.dir/src/uav_utils_test.cpp.o
/home/yangzhe/exercise2/devel/lib/uav_utils/uav_utils-test: uav_simulator/Utils/uav_utils/CMakeFiles/uav_utils-test.dir/build.make
/home/yangzhe/exercise2/devel/lib/uav_utils/uav_utils-test: gtest/lib/libgtest.so
/home/yangzhe/exercise2/devel/lib/uav_utils/uav_utils-test: uav_simulator/Utils/uav_utils/CMakeFiles/uav_utils-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/yangzhe/exercise2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/yangzhe/exercise2/devel/lib/uav_utils/uav_utils-test"
	cd /home/yangzhe/exercise2/build/uav_simulator/Utils/uav_utils && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/uav_utils-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
uav_simulator/Utils/uav_utils/CMakeFiles/uav_utils-test.dir/build: /home/yangzhe/exercise2/devel/lib/uav_utils/uav_utils-test

.PHONY : uav_simulator/Utils/uav_utils/CMakeFiles/uav_utils-test.dir/build

uav_simulator/Utils/uav_utils/CMakeFiles/uav_utils-test.dir/clean:
	cd /home/yangzhe/exercise2/build/uav_simulator/Utils/uav_utils && $(CMAKE_COMMAND) -P CMakeFiles/uav_utils-test.dir/cmake_clean.cmake
.PHONY : uav_simulator/Utils/uav_utils/CMakeFiles/uav_utils-test.dir/clean

uav_simulator/Utils/uav_utils/CMakeFiles/uav_utils-test.dir/depend:
	cd /home/yangzhe/exercise2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yangzhe/exercise2/src /home/yangzhe/exercise2/src/uav_simulator/Utils/uav_utils /home/yangzhe/exercise2/build /home/yangzhe/exercise2/build/uav_simulator/Utils/uav_utils /home/yangzhe/exercise2/build/uav_simulator/Utils/uav_utils/CMakeFiles/uav_utils-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : uav_simulator/Utils/uav_utils/CMakeFiles/uav_utils-test.dir/depend

