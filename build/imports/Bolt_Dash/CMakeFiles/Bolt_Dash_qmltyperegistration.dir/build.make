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

# Utility rule file for Bolt_Dash_qmltyperegistration.

# Include any custom commands dependencies for this target.
include imports/Bolt_Dash/CMakeFiles/Bolt_Dash_qmltyperegistration.dir/compiler_depend.make

# Include the progress variables for this target.
include imports/Bolt_Dash/CMakeFiles/Bolt_Dash_qmltyperegistration.dir/progress.make

imports/Bolt_Dash/CMakeFiles/Bolt_Dash_qmltyperegistration: imports/Bolt_Dash/bolt_dash_qmltyperegistrations.cpp
imports/Bolt_Dash/CMakeFiles/Bolt_Dash_qmltyperegistration: qml/Bolt_Dash/Bolt_Dash.qmltypes

imports/Bolt_Dash/bolt_dash_qmltyperegistrations.cpp: imports/Bolt_Dash/qmltypes/Bolt_Dash_foreign_types.txt
imports/Bolt_Dash/bolt_dash_qmltyperegistrations.cpp: imports/Bolt_Dash/meta_types/qt6bolt_dash_debug_metatypes.json
imports/Bolt_Dash/bolt_dash_qmltyperegistrations.cpp: /opt/homebrew/share/qt/libexec/qmltyperegistrar
imports/Bolt_Dash/bolt_dash_qmltyperegistrations.cpp: /opt/homebrew/share/qt/metatypes/qt6qml_release_metatypes.json
imports/Bolt_Dash/bolt_dash_qmltyperegistrations.cpp: /opt/homebrew/share/qt/metatypes/qt6core_release_metatypes.json
imports/Bolt_Dash/bolt_dash_qmltyperegistrations.cpp: /opt/homebrew/share/qt/metatypes/qt6network_release_metatypes.json
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/mason/Documents/Code/dash-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic QML type registration for target Bolt_Dash"
	cd /Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash && /opt/homebrew/share/qt/libexec/qmltyperegistrar --generate-qmltypes=/Users/mason/Documents/Code/dash-cpp/build/qml/Bolt_Dash/Bolt_Dash.qmltypes --import-name=Bolt_Dash --major-version=1 --minor-version=0 @/Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash/qmltypes/Bolt_Dash_foreign_types.txt -o /Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash/bolt_dash_qmltyperegistrations.cpp /Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash/meta_types/qt6bolt_dash_debug_metatypes.json
	cd /Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash && /opt/homebrew/Cellar/cmake/3.27.8/bin/cmake -E make_directory /Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash/.generated
	cd /Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash && /opt/homebrew/Cellar/cmake/3.27.8/bin/cmake -E touch /Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash/.generated/Bolt_Dash.qmltypes

qml/Bolt_Dash/Bolt_Dash.qmltypes: imports/Bolt_Dash/bolt_dash_qmltyperegistrations.cpp
	@$(CMAKE_COMMAND) -E touch_nocreate qml/Bolt_Dash/Bolt_Dash.qmltypes

imports/Bolt_Dash/meta_types/qt6bolt_dash_debug_metatypes.json: imports/Bolt_Dash/meta_types/qt6bolt_dash_debug_metatypes.json.gen
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/mason/Documents/Code/dash-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating meta_types/qt6bolt_dash_debug_metatypes.json"
	cd /Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash && /opt/homebrew/Cellar/cmake/3.27.8/bin/cmake -E true

imports/Bolt_Dash/meta_types/qt6bolt_dash_debug_metatypes.json.gen: /opt/homebrew/share/qt/libexec/moc
imports/Bolt_Dash/meta_types/qt6bolt_dash_debug_metatypes.json.gen: imports/Bolt_Dash/meta_types/Bolt_Dash_json_file_list.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/mason/Documents/Code/dash-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Running moc --collect-json for target Bolt_Dash"
	cd /Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash && /opt/homebrew/share/qt/libexec/moc -o /Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash/meta_types/qt6bolt_dash_debug_metatypes.json.gen --collect-json @/Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash/meta_types/Bolt_Dash_json_file_list.txt
	cd /Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash && /opt/homebrew/Cellar/cmake/3.27.8/bin/cmake -E copy_if_different /Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash/meta_types/qt6bolt_dash_debug_metatypes.json.gen /Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash/meta_types/qt6bolt_dash_debug_metatypes.json

Bolt_Dash_qmltyperegistration: imports/Bolt_Dash/CMakeFiles/Bolt_Dash_qmltyperegistration
Bolt_Dash_qmltyperegistration: imports/Bolt_Dash/bolt_dash_qmltyperegistrations.cpp
Bolt_Dash_qmltyperegistration: imports/Bolt_Dash/meta_types/qt6bolt_dash_debug_metatypes.json
Bolt_Dash_qmltyperegistration: imports/Bolt_Dash/meta_types/qt6bolt_dash_debug_metatypes.json.gen
Bolt_Dash_qmltyperegistration: qml/Bolt_Dash/Bolt_Dash.qmltypes
Bolt_Dash_qmltyperegistration: imports/Bolt_Dash/CMakeFiles/Bolt_Dash_qmltyperegistration.dir/build.make
.PHONY : Bolt_Dash_qmltyperegistration

# Rule to build all files generated by this target.
imports/Bolt_Dash/CMakeFiles/Bolt_Dash_qmltyperegistration.dir/build: Bolt_Dash_qmltyperegistration
.PHONY : imports/Bolt_Dash/CMakeFiles/Bolt_Dash_qmltyperegistration.dir/build

imports/Bolt_Dash/CMakeFiles/Bolt_Dash_qmltyperegistration.dir/clean:
	cd /Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash && $(CMAKE_COMMAND) -P CMakeFiles/Bolt_Dash_qmltyperegistration.dir/cmake_clean.cmake
.PHONY : imports/Bolt_Dash/CMakeFiles/Bolt_Dash_qmltyperegistration.dir/clean

imports/Bolt_Dash/CMakeFiles/Bolt_Dash_qmltyperegistration.dir/depend:
	cd /Users/mason/Documents/Code/dash-cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/mason/Documents/Code/dash-cpp/Bolt_Dash /Users/mason/Documents/Code/dash-cpp/Bolt_Dash/imports/Bolt_Dash /Users/mason/Documents/Code/dash-cpp/build /Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash /Users/mason/Documents/Code/dash-cpp/build/imports/Bolt_Dash/CMakeFiles/Bolt_Dash_qmltyperegistration.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : imports/Bolt_Dash/CMakeFiles/Bolt_Dash_qmltyperegistration.dir/depend

