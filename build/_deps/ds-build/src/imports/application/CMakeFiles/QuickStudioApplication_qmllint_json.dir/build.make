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

# Utility rule file for QuickStudioApplication_qmllint_json.

# Include any custom commands dependencies for this target.
include _deps/ds-build/src/imports/application/CMakeFiles/QuickStudioApplication_qmllint_json.dir/compiler_depend.make

# Include the progress variables for this target.
include _deps/ds-build/src/imports/application/CMakeFiles/QuickStudioApplication_qmllint_json.dir/progress.make

_deps/ds-build/src/imports/application/CMakeFiles/QuickStudioApplication_qmllint_json: /opt/homebrew/bin/qmllint
_deps/ds-build/src/imports/application/CMakeFiles/QuickStudioApplication_qmllint_json: _deps/ds-build/src/imports/application/.rcc/qmllint/QuickStudioApplication_json.rsp

QuickStudioApplication_qmllint_json: _deps/ds-build/src/imports/application/CMakeFiles/QuickStudioApplication_qmllint_json
QuickStudioApplication_qmllint_json: _deps/ds-build/src/imports/application/CMakeFiles/QuickStudioApplication_qmllint_json.dir/build.make
.PHONY : QuickStudioApplication_qmllint_json

# Rule to build all files generated by this target.
_deps/ds-build/src/imports/application/CMakeFiles/QuickStudioApplication_qmllint_json.dir/build: QuickStudioApplication_qmllint_json
.PHONY : _deps/ds-build/src/imports/application/CMakeFiles/QuickStudioApplication_qmllint_json.dir/build

_deps/ds-build/src/imports/application/CMakeFiles/QuickStudioApplication_qmllint_json.dir/clean:
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/application && $(CMAKE_COMMAND) -P CMakeFiles/QuickStudioApplication_qmllint_json.dir/cmake_clean.cmake
.PHONY : _deps/ds-build/src/imports/application/CMakeFiles/QuickStudioApplication_qmllint_json.dir/clean

_deps/ds-build/src/imports/application/CMakeFiles/QuickStudioApplication_qmllint_json.dir/depend:
	cd /Users/mason/Documents/Code/dash-cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/mason/Documents/Code/dash-cpp/Bolt_Dash /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-src/src/imports/application /Users/mason/Documents/Code/dash-cpp/build /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/application /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/application/CMakeFiles/QuickStudioApplication_qmllint_json.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : _deps/ds-build/src/imports/application/CMakeFiles/QuickStudioApplication_qmllint_json.dir/depend

