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

# Utility rule file for poc.

# Include any custom commands dependencies for this target.
include CMakeFiles/poc.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/poc.dir/progress.make

CMakeFiles/poc:
	/usr/bin/cmake -E sleep 0

poc: CMakeFiles/poc
poc: CMakeFiles/poc.dir/build.make
.PHONY : poc

# Rule to build all files generated by this target.
CMakeFiles/poc.dir/build: poc
.PHONY : CMakeFiles/poc.dir/build

CMakeFiles/poc.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/poc.dir/cmake_clean.cmake
.PHONY : CMakeFiles/poc.dir/clean

CMakeFiles/poc.dir/depend:
	cd /home/ayush/Work/cychain-poc/build-coverage && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ayush/Work/cychain-poc /home/ayush/Work/cychain-poc /home/ayush/Work/cychain-poc/build-coverage /home/ayush/Work/cychain-poc/build-coverage /home/ayush/Work/cychain-poc/build-coverage/CMakeFiles/poc.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/poc.dir/depend

