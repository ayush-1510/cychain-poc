# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.30

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ayush/Work/cychain-poc

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ayush/Work/cychain-poc/build-coverage

# Utility rule file for benchmark_JoyeLibert.

# Include any custom commands dependencies for this target.
include include/bicycl/benchs/CMakeFiles/benchmark_JoyeLibert.dir/compiler_depend.make

# Include the progress variables for this target.
include include/bicycl/benchs/CMakeFiles/benchmark_JoyeLibert.dir/progress.make

include/bicycl/benchs/CMakeFiles/benchmark_JoyeLibert:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/ayush/Work/cychain-poc/build-coverage/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running benchmark_JoyeLibert"
	cd /home/ayush/Work/cychain-poc/build-coverage/include/bicycl/benchs && ./benchmark_JoyeLibert

benchmark_JoyeLibert: include/bicycl/benchs/CMakeFiles/benchmark_JoyeLibert
benchmark_JoyeLibert: include/bicycl/benchs/CMakeFiles/benchmark_JoyeLibert.dir/build.make
.PHONY : benchmark_JoyeLibert

# Rule to build all files generated by this target.
include/bicycl/benchs/CMakeFiles/benchmark_JoyeLibert.dir/build: benchmark_JoyeLibert
.PHONY : include/bicycl/benchs/CMakeFiles/benchmark_JoyeLibert.dir/build

include/bicycl/benchs/CMakeFiles/benchmark_JoyeLibert.dir/clean:
	cd /home/ayush/Work/cychain-poc/build-coverage/include/bicycl/benchs && $(CMAKE_COMMAND) -P CMakeFiles/benchmark_JoyeLibert.dir/cmake_clean.cmake
.PHONY : include/bicycl/benchs/CMakeFiles/benchmark_JoyeLibert.dir/clean

include/bicycl/benchs/CMakeFiles/benchmark_JoyeLibert.dir/depend:
	cd /home/ayush/Work/cychain-poc/build-coverage && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ayush/Work/cychain-poc /home/ayush/Work/cychain-poc/include/bicycl/benchs /home/ayush/Work/cychain-poc/build-coverage /home/ayush/Work/cychain-poc/build-coverage/include/bicycl/benchs /home/ayush/Work/cychain-poc/build-coverage/include/bicycl/benchs/CMakeFiles/benchmark_JoyeLibert.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : include/bicycl/benchs/CMakeFiles/benchmark_JoyeLibert.dir/depend

