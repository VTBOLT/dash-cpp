# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

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
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.27.8/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.27.8/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/mason/Documents/Code/dash-cpp/Bolt_Dash

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/mason/Documents/Code/dash-cpp/build

# Utility rule file for Bolt_Dashplugin_init_autogen.

# Include any custom commands dependencies for this target.
include imports/Bolt_Dash/CMakeFiles/Bolt_Dashplugin_init_autogen.dir/compiler_depend.make

# Include the progress variables for this target.
include imports/Bolt_Dash/CMakeFiles/Bolt_Dashplugin_init_autogen.dir/progress.make

imports/Bolt_Dash/CMakeFiles/Bolt_Dashplugin_init_autogen: imports/Bolt_Dash/Bolt_Dashplugin_init.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/mason/Documents/Code/dash-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic MOC and UIC for target Bolt_Dashplugin_init"
	cd /Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash && /opt/homebrew/Cellar/cmake/3.27.8/bin/cmake -E cmake_autogen /Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash/CMakeFiles/Bolt_Dashplugin_init_autogen.dir/AutogenInfo.json Debug

Bolt_Dashplugin_init_autogen: imports/Bolt_Dash/CMakeFiles/Bolt_Dashplugin_init_autogen
Bolt_Dashplugin_init_autogen: imports/Bolt_Dash/CMakeFiles/Bolt_Dashplugin_init_autogen.dir/build.make
.PHONY : Bolt_Dashplugin_init_autogen

# Rule to build all files generated by this target.
imports/Bolt_Dash/CMakeFiles/Bolt_Dashplugin_init_autogen.dir/build: Bolt_Dashplugin_init_autogen
.PHONY : imports/Bolt_Dash/CMakeFiles/Bolt_Dashplugin_init_autogen.dir/build

imports/Bolt_Dash/CMakeFiles/Bolt_Dashplugin_init_autogen.dir/clean:
	cd /Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash && $(CMAKE_COMMAND) -P CMakeFiles/Bolt_Dashplugin_init_autogen.dir/cmake_clean.cmake
.PHONY : imports/Bolt_Dash/CMakeFiles/Bolt_Dashplugin_init_autogen.dir/clean

imports/Bolt_Dash/CMakeFiles/Bolt_Dashplugin_init_autogen.dir/depend:
	cd /Users/mason/Documents/Code/dash-cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/mason/Documents/Code/dash-cpp/Bolt_Dash /Users/mason/Documents/Code/dash-cpp/Bolt_Dash/imports/Bolt_Dash /Users/mason/Documents/Code/dash-cpp/build /Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash /Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash/CMakeFiles/Bolt_Dashplugin_init_autogen.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : imports/Bolt_Dash/CMakeFiles/Bolt_Dashplugin_init_autogen.dir/depend

