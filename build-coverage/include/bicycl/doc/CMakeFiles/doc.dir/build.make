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

# Utility rule file for doc.

# Include any custom commands dependencies for this target.
include include/bicycl/doc/CMakeFiles/doc.dir/compiler_depend.make

# Include the progress variables for this target.
include include/bicycl/doc/CMakeFiles/doc.dir/progress.make

include/bicycl/doc/CMakeFiles/doc:
	cd /home/ayush/Work/cychain-poc/build-coverage/include/bicycl/doc && /usr/bin/cmake -E echo The\ documentation\ cannot\ be\ build\ as\ CMake\ failed\ to\ find\ doxygen\ during\ the\ configuration\ step.\ If\ you\ want\ to\ build\ the\ documentation,\ you\ need\ to\ install\ doxygen\ and\ re-run\ the\ configuration\ step\ of\ CMake.

doc: include/bicycl/doc/CMakeFiles/doc
doc: include/bicycl/doc/CMakeFiles/doc.dir/build.make
.PHONY : doc

# Rule to build all files generated by this target.
include/bicycl/doc/CMakeFiles/doc.dir/build: doc
.PHONY : include/bicycl/doc/CMakeFiles/doc.dir/build

include/bicycl/doc/CMakeFiles/doc.dir/clean:
	cd /home/ayush/Work/cychain-poc/build-coverage/include/bicycl/doc && $(CMAKE_COMMAND) -P CMakeFiles/doc.dir/cmake_clean.cmake
.PHONY : include/bicycl/doc/CMakeFiles/doc.dir/clean

include/bicycl/doc/CMakeFiles/doc.dir/depend:
	cd /home/ayush/Work/cychain-poc/build-coverage && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ayush/Work/cychain-poc /home/ayush/Work/cychain-poc/include/bicycl/doc /home/ayush/Work/cychain-poc/build-coverage /home/ayush/Work/cychain-poc/build-coverage/include/bicycl/doc /home/ayush/Work/cychain-poc/build-coverage/include/bicycl/doc/CMakeFiles/doc.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : include/bicycl/doc/CMakeFiles/doc.dir/depend

