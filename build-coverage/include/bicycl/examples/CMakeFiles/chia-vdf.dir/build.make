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

# Include any dependencies generated for this target.
include include/bicycl/examples/CMakeFiles/chia-vdf.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include include/bicycl/examples/CMakeFiles/chia-vdf.dir/compiler_depend.make

# Include the progress variables for this target.
include include/bicycl/examples/CMakeFiles/chia-vdf.dir/progress.make

# Include the compile flags for this target's objects.
include include/bicycl/examples/CMakeFiles/chia-vdf.dir/flags.make

include/bicycl/examples/CMakeFiles/chia-vdf.dir/chia-vdf.cpp.o: include/bicycl/examples/CMakeFiles/chia-vdf.dir/flags.make
include/bicycl/examples/CMakeFiles/chia-vdf.dir/chia-vdf.cpp.o: /home/ayush/Work/cychain-poc/include/bicycl/examples/chia-vdf.cpp
include/bicycl/examples/CMakeFiles/chia-vdf.dir/chia-vdf.cpp.o: include/bicycl/examples/CMakeFiles/chia-vdf.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/ayush/Work/cychain-poc/build-coverage/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object include/bicycl/examples/CMakeFiles/chia-vdf.dir/chia-vdf.cpp.o"
	cd /home/ayush/Work/cychain-poc/build-coverage/include/bicycl/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT include/bicycl/examples/CMakeFiles/chia-vdf.dir/chia-vdf.cpp.o -MF CMakeFiles/chia-vdf.dir/chia-vdf.cpp.o.d -o CMakeFiles/chia-vdf.dir/chia-vdf.cpp.o -c /home/ayush/Work/cychain-poc/include/bicycl/examples/chia-vdf.cpp

include/bicycl/examples/CMakeFiles/chia-vdf.dir/chia-vdf.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/chia-vdf.dir/chia-vdf.cpp.i"
	cd /home/ayush/Work/cychain-poc/build-coverage/include/bicycl/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ayush/Work/cychain-poc/include/bicycl/examples/chia-vdf.cpp > CMakeFiles/chia-vdf.dir/chia-vdf.cpp.i

include/bicycl/examples/CMakeFiles/chia-vdf.dir/chia-vdf.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/chia-vdf.dir/chia-vdf.cpp.s"
	cd /home/ayush/Work/cychain-poc/build-coverage/include/bicycl/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ayush/Work/cychain-poc/include/bicycl/examples/chia-vdf.cpp -o CMakeFiles/chia-vdf.dir/chia-vdf.cpp.s

# Object files for target chia-vdf
chia__vdf_OBJECTS = \
"CMakeFiles/chia-vdf.dir/chia-vdf.cpp.o"

# External object files for target chia-vdf
chia__vdf_EXTERNAL_OBJECTS =

include/bicycl/examples/chia-vdf: include/bicycl/examples/CMakeFiles/chia-vdf.dir/chia-vdf.cpp.o
include/bicycl/examples/chia-vdf: include/bicycl/examples/CMakeFiles/chia-vdf.dir/build.make
include/bicycl/examples/chia-vdf: /usr/lib/libgmp.so
include/bicycl/examples/chia-vdf: /usr/lib/libgmpxx.so
include/bicycl/examples/chia-vdf: /usr/lib/libcrypto.so
include/bicycl/examples/chia-vdf: include/bicycl/examples/CMakeFiles/chia-vdf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/ayush/Work/cychain-poc/build-coverage/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable chia-vdf"
	cd /home/ayush/Work/cychain-poc/build-coverage/include/bicycl/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/chia-vdf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
include/bicycl/examples/CMakeFiles/chia-vdf.dir/build: include/bicycl/examples/chia-vdf
.PHONY : include/bicycl/examples/CMakeFiles/chia-vdf.dir/build

include/bicycl/examples/CMakeFiles/chia-vdf.dir/clean:
	cd /home/ayush/Work/cychain-poc/build-coverage/include/bicycl/examples && $(CMAKE_COMMAND) -P CMakeFiles/chia-vdf.dir/cmake_clean.cmake
.PHONY : include/bicycl/examples/CMakeFiles/chia-vdf.dir/clean

include/bicycl/examples/CMakeFiles/chia-vdf.dir/depend:
	cd /home/ayush/Work/cychain-poc/build-coverage && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ayush/Work/cychain-poc /home/ayush/Work/cychain-poc/include/bicycl/examples /home/ayush/Work/cychain-poc/build-coverage /home/ayush/Work/cychain-poc/build-coverage/include/bicycl/examples /home/ayush/Work/cychain-poc/build-coverage/include/bicycl/examples/CMakeFiles/chia-vdf.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : include/bicycl/examples/CMakeFiles/chia-vdf.dir/depend

