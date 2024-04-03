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

# Utility rule file for QuickStudioEffects_qmltyperegistration.

# Include any custom commands dependencies for this target.
include _deps/ds-build/src/imports/effects_qt6/CMakeFiles/QuickStudioEffects_qmltyperegistration.dir/compiler_depend.make

# Include the progress variables for this target.
include _deps/ds-build/src/imports/effects_qt6/CMakeFiles/QuickStudioEffects_qmltyperegistration.dir/progress.make

_deps/ds-build/src/imports/effects_qt6/CMakeFiles/QuickStudioEffects_qmltyperegistration: _deps/ds-build/src/imports/effects_qt6/quickstudioeffects_qmltyperegistrations.cpp
_deps/ds-build/src/imports/effects_qt6/CMakeFiles/QuickStudioEffects_qmltyperegistration: qml/QtQuick/Studio/Effects/QuickStudioEffects.qmltypes

_deps/ds-build/src/imports/effects_qt6/quickstudioeffects_qmltyperegistrations.cpp: _deps/ds-build/src/imports/effects_qt6/qmltypes/QuickStudioEffects_foreign_types.txt
_deps/ds-build/src/imports/effects_qt6/quickstudioeffects_qmltyperegistrations.cpp: _deps/ds-build/src/imports/effects_qt6/meta_types/qt6quickstudioeffects_debug_metatypes.json
_deps/ds-build/src/imports/effects_qt6/quickstudioeffects_qmltyperegistrations.cpp: /opt/homebrew/share/qt/libexec/qmltyperegistrar
_deps/ds-build/src/imports/effects_qt6/quickstudioeffects_qmltyperegistrations.cpp: /opt/homebrew/share/qt/metatypes/qt6qml_release_metatypes.json
_deps/ds-build/src/imports/effects_qt6/quickstudioeffects_qmltyperegistrations.cpp: /opt/homebrew/share/qt/metatypes/qt6core_release_metatypes.json
_deps/ds-build/src/imports/effects_qt6/quickstudioeffects_qmltyperegistrations.cpp: /opt/homebrew/share/qt/metatypes/qt6network_release_metatypes.json
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/mason/Documents/Code/dash-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic QML type registration for target QuickStudioEffects"
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/effects_qt6 && /opt/homebrew/share/qt/libexec/qmltyperegistrar --generate-qmltypes=/Users/mason/Documents/Code/dash-cpp/build/qml/QtQuick/Studio/Effects/QuickStudioEffects.qmltypes --import-name=QtQuick.Studio.Effects --major-version=6 --minor-version=4 --past-major-version 1 @/Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/effects_qt6/qmltypes/QuickStudioEffects_foreign_types.txt -o /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/effects_qt6/quickstudioeffects_qmltyperegistrations.cpp /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/effects_qt6/meta_types/qt6quickstudioeffects_debug_metatypes.json
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/effects_qt6 && /opt/homebrew/Cellar/cmake/3.27.8/bin/cmake -E make_directory /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/effects_qt6/.generated
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/effects_qt6 && /opt/homebrew/Cellar/cmake/3.27.8/bin/cmake -E touch /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/effects_qt6/.generated/QuickStudioEffects.qmltypes

qml/QtQuick/Studio/Effects/QuickStudioEffects.qmltypes: _deps/ds-build/src/imports/effects_qt6/quickstudioeffects_qmltyperegistrations.cpp
	@$(CMAKE_COMMAND) -E touch_nocreate qml/QtQuick/Studio/Effects/QuickStudioEffects.qmltypes

_deps/ds-build/src/imports/effects_qt6/meta_types/qt6quickstudioeffects_debug_metatypes.json: _deps/ds-build/src/imports/effects_qt6/meta_types/qt6quickstudioeffects_debug_metatypes.json.gen
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/mason/Documents/Code/dash-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating meta_types/qt6quickstudioeffects_debug_metatypes.json"
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/effects_qt6 && /opt/homebrew/Cellar/cmake/3.27.8/bin/cmake -E true

_deps/ds-build/src/imports/effects_qt6/meta_types/qt6quickstudioeffects_debug_metatypes.json.gen: /opt/homebrew/share/qt/libexec/moc
_deps/ds-build/src/imports/effects_qt6/meta_types/qt6quickstudioeffects_debug_metatypes.json.gen: _deps/ds-build/src/imports/effects_qt6/meta_types/QuickStudioEffects_json_file_list.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/mason/Documents/Code/dash-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Running moc --collect-json for target QuickStudioEffects"
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/effects_qt6 && /opt/homebrew/share/qt/libexec/moc -o /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/effects_qt6/meta_types/qt6quickstudioeffects_debug_metatypes.json.gen --collect-json @/Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/effects_qt6/meta_types/QuickStudioEffects_json_file_list.txt
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/effects_qt6 && /opt/homebrew/Cellar/cmake/3.27.8/bin/cmake -E copy_if_different /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/effects_qt6/meta_types/qt6quickstudioeffects_debug_metatypes.json.gen /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/effects_qt6/meta_types/qt6quickstudioeffects_debug_metatypes.json

QuickStudioEffects_qmltyperegistration: _deps/ds-build/src/imports/effects_qt6/CMakeFiles/QuickStudioEffects_qmltyperegistration
QuickStudioEffects_qmltyperegistration: _deps/ds-build/src/imports/effects_qt6/meta_types/qt6quickstudioeffects_debug_metatypes.json
QuickStudioEffects_qmltyperegistration: _deps/ds-build/src/imports/effects_qt6/meta_types/qt6quickstudioeffects_debug_metatypes.json.gen
QuickStudioEffects_qmltyperegistration: _deps/ds-build/src/imports/effects_qt6/quickstudioeffects_qmltyperegistrations.cpp
QuickStudioEffects_qmltyperegistration: qml/QtQuick/Studio/Effects/QuickStudioEffects.qmltypes
QuickStudioEffects_qmltyperegistration: _deps/ds-build/src/imports/effects_qt6/CMakeFiles/QuickStudioEffects_qmltyperegistration.dir/build.make
.PHONY : QuickStudioEffects_qmltyperegistration

# Rule to build all files generated by this target.
_deps/ds-build/src/imports/effects_qt6/CMakeFiles/QuickStudioEffects_qmltyperegistration.dir/build: QuickStudioEffects_qmltyperegistration
.PHONY : _deps/ds-build/src/imports/effects_qt6/CMakeFiles/QuickStudioEffects_qmltyperegistration.dir/build

_deps/ds-build/src/imports/effects_qt6/CMakeFiles/QuickStudioEffects_qmltyperegistration.dir/clean:
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/effects_qt6 && $(CMAKE_COMMAND) -P CMakeFiles/QuickStudioEffects_qmltyperegistration.dir/cmake_clean.cmake
.PHONY : _deps/ds-build/src/imports/effects_qt6/CMakeFiles/QuickStudioEffects_qmltyperegistration.dir/clean

_deps/ds-build/src/imports/effects_qt6/CMakeFiles/QuickStudioEffects_qmltyperegistration.dir/depend:
	cd /Users/mason/Documents/Code/dash-cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/mason/Documents/Code/dash-cpp/Bolt_Dash /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-src/src/imports/effects_qt6 /Users/mason/Documents/Code/dash-cpp/build /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/effects_qt6 /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/effects_qt6/CMakeFiles/QuickStudioEffects_qmltyperegistration.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : _deps/ds-build/src/imports/effects_qt6/CMakeFiles/QuickStudioEffects_qmltyperegistration.dir/depend

