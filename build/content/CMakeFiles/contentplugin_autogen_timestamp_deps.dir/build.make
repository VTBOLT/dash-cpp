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
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.30.0/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.30.0/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/mason/Documents/Code/dash-cpp/Bolt_Dash

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/mason/Documents/Code/dash-cpp/build

# Utility rule file for contentplugin_autogen_timestamp_deps.

# Include any custom commands dependencies for this target.
include content/CMakeFiles/contentplugin_autogen_timestamp_deps.dir/compiler_depend.make

# Include the progress variables for this target.
include content/CMakeFiles/contentplugin_autogen_timestamp_deps.dir/progress.make

content/CMakeFiles/contentplugin_autogen_timestamp_deps: content/contentplugin_contentPlugin.cpp

contentplugin_autogen_timestamp_deps: content/CMakeFiles/contentplugin_autogen_timestamp_deps
contentplugin_autogen_timestamp_deps: content/CMakeFiles/contentplugin_autogen_timestamp_deps.dir/build.make
.PHONY : contentplugin_autogen_timestamp_deps

# Rule to build all files generated by this target.
content/CMakeFiles/contentplugin_autogen_timestamp_deps.dir/build: contentplugin_autogen_timestamp_deps
.PHONY : content/CMakeFiles/contentplugin_autogen_timestamp_deps.dir/build

content/CMakeFiles/contentplugin_autogen_timestamp_deps.dir/clean:
	cd /Users/mason/Documents/Code/dash-cpp/build/content && $(CMAKE_COMMAND) -P CMakeFiles/contentplugin_autogen_timestamp_deps.dir/cmake_clean.cmake
.PHONY : content/CMakeFiles/contentplugin_autogen_timestamp_deps.dir/clean

content/CMakeFiles/contentplugin_autogen_timestamp_deps.dir/depend:
	cd /Users/mason/Documents/Code/dash-cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/mason/Documents/Code/dash-cpp/Bolt_Dash /Users/mason/Documents/Code/dash-cpp/Bolt_Dash/content /Users/mason/Documents/Code/dash-cpp/build /Users/mason/Documents/Code/dash-cpp/build/content /Users/mason/Documents/Code/dash-cpp/build/content/CMakeFiles/contentplugin_autogen_timestamp_deps.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : content/CMakeFiles/contentplugin_autogen_timestamp_deps.dir/depend

