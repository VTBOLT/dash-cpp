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

# Include any dependencies generated for this target.
include _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/compiler_depend.make

# Include the progress variables for this target.
include _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/progress.make

# Include the compile flags for this target's objects.
include _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/flags.make

_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init_autogen/mocs_compilation.cpp.o: _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/flags.make
_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init_autogen/mocs_compilation.cpp.o: _deps/ds-build/src/imports/tools/eventsimulator/QuickStudioEventSimulatorplugin_init_autogen/mocs_compilation.cpp
_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init_autogen/mocs_compilation.cpp.o: _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/mason/Documents/Code/dash-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init_autogen/mocs_compilation.cpp.o"
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsimulator && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init_autogen/mocs_compilation.cpp.o -MF CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init_autogen/mocs_compilation.cpp.o.d -o CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init_autogen/mocs_compilation.cpp.o -c /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsimulator/QuickStudioEventSimulatorplugin_init_autogen/mocs_compilation.cpp

_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init_autogen/mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init_autogen/mocs_compilation.cpp.i"
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsimulator && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsimulator/QuickStudioEventSimulatorplugin_init_autogen/mocs_compilation.cpp > CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init_autogen/mocs_compilation.cpp.i

_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init_autogen/mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init_autogen/mocs_compilation.cpp.s"
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsimulator && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsimulator/QuickStudioEventSimulatorplugin_init_autogen/mocs_compilation.cpp -o CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init_autogen/mocs_compilation.cpp.s

_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init.cpp.o: _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/flags.make
_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init.cpp.o: _deps/ds-build/src/imports/tools/eventsimulator/QuickStudioEventSimulatorplugin_init.cpp
_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init.cpp.o: _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/mason/Documents/Code/dash-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init.cpp.o"
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsimulator && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init.cpp.o -MF CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init.cpp.o.d -o CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init.cpp.o -c /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsimulator/QuickStudioEventSimulatorplugin_init.cpp

_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init.cpp.i"
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsimulator && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsimulator/QuickStudioEventSimulatorplugin_init.cpp > CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init.cpp.i

_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init.cpp.s"
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsimulator && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsimulator/QuickStudioEventSimulatorplugin_init.cpp -o CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init.cpp.s

QuickStudioEventSimulatorplugin_init: _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init_autogen/mocs_compilation.cpp.o
QuickStudioEventSimulatorplugin_init: _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/QuickStudioEventSimulatorplugin_init.cpp.o
QuickStudioEventSimulatorplugin_init: _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/build.make
.PHONY : QuickStudioEventSimulatorplugin_init

# Rule to build all files generated by this target.
_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/build: QuickStudioEventSimulatorplugin_init
.PHONY : _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/build

_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/clean:
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsimulator && $(CMAKE_COMMAND) -P CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/cmake_clean.cmake
.PHONY : _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/clean

_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/depend:
	cd /Users/mason/Documents/Code/dash-cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/mason/Documents/Code/dash-cpp/Bolt_Dash /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-src/src/imports/tools/eventsimulator /Users/mason/Documents/Code/dash-cpp/build /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsimulator /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : _deps/ds-build/src/imports/tools/eventsimulator/CMakeFiles/QuickStudioEventSimulatorplugin_init.dir/depend

