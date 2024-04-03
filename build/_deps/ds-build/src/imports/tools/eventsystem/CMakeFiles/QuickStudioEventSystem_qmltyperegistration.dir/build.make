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

# Utility rule file for QuickStudioEventSystem_qmltyperegistration.

# Include any custom commands dependencies for this target.
include _deps/ds-build/src/imports/tools/eventsystem/CMakeFiles/QuickStudioEventSystem_qmltyperegistration.dir/compiler_depend.make

# Include the progress variables for this target.
include _deps/ds-build/src/imports/tools/eventsystem/CMakeFiles/QuickStudioEventSystem_qmltyperegistration.dir/progress.make

_deps/ds-build/src/imports/tools/eventsystem/CMakeFiles/QuickStudioEventSystem_qmltyperegistration: _deps/ds-build/src/imports/tools/eventsystem/quickstudioeventsystem_qmltyperegistrations.cpp
_deps/ds-build/src/imports/tools/eventsystem/CMakeFiles/QuickStudioEventSystem_qmltyperegistration: qml/QtQuick/Studio/EventSystem/QuickStudioEventSystem.qmltypes

_deps/ds-build/src/imports/tools/eventsystem/quickstudioeventsystem_qmltyperegistrations.cpp: _deps/ds-build/src/imports/tools/eventsystem/qmltypes/QuickStudioEventSystem_foreign_types.txt
_deps/ds-build/src/imports/tools/eventsystem/quickstudioeventsystem_qmltyperegistrations.cpp: _deps/ds-build/src/imports/tools/eventsystem/meta_types/qt6quickstudioeventsystem_debug_metatypes.json
_deps/ds-build/src/imports/tools/eventsystem/quickstudioeventsystem_qmltyperegistrations.cpp: /opt/homebrew/share/qt/libexec/qmltyperegistrar
_deps/ds-build/src/imports/tools/eventsystem/quickstudioeventsystem_qmltyperegistrations.cpp: /opt/homebrew/share/qt/metatypes/qt6qml_release_metatypes.json
_deps/ds-build/src/imports/tools/eventsystem/quickstudioeventsystem_qmltyperegistrations.cpp: /opt/homebrew/share/qt/metatypes/qt6core_release_metatypes.json
_deps/ds-build/src/imports/tools/eventsystem/quickstudioeventsystem_qmltyperegistrations.cpp: /opt/homebrew/share/qt/metatypes/qt6network_release_metatypes.json
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/mason/Documents/Code/dash-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic QML type registration for target QuickStudioEventSystem"
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsystem && /opt/homebrew/share/qt/libexec/qmltyperegistrar --generate-qmltypes=/Users/mason/Documents/Code/dash-cpp/build/qml/QtQuick/Studio/EventSystem/QuickStudioEventSystem.qmltypes --import-name=QtQuick.Studio.EventSystem --major-version=6 --minor-version=4 --past-major-version 1 @/Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsystem/qmltypes/QuickStudioEventSystem_foreign_types.txt -o /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsystem/quickstudioeventsystem_qmltyperegistrations.cpp /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsystem/meta_types/qt6quickstudioeventsystem_debug_metatypes.json
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsystem && /opt/homebrew/Cellar/cmake/3.27.8/bin/cmake -E make_directory /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsystem/.generated
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsystem && /opt/homebrew/Cellar/cmake/3.27.8/bin/cmake -E touch /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsystem/.generated/QuickStudioEventSystem.qmltypes

qml/QtQuick/Studio/EventSystem/QuickStudioEventSystem.qmltypes: _deps/ds-build/src/imports/tools/eventsystem/quickstudioeventsystem_qmltyperegistrations.cpp
	@$(CMAKE_COMMAND) -E touch_nocreate qml/QtQuick/Studio/EventSystem/QuickStudioEventSystem.qmltypes

_deps/ds-build/src/imports/tools/eventsystem/meta_types/qt6quickstudioeventsystem_debug_metatypes.json: _deps/ds-build/src/imports/tools/eventsystem/meta_types/qt6quickstudioeventsystem_debug_metatypes.json.gen
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/mason/Documents/Code/dash-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating meta_types/qt6quickstudioeventsystem_debug_metatypes.json"
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsystem && /opt/homebrew/Cellar/cmake/3.27.8/bin/cmake -E true

_deps/ds-build/src/imports/tools/eventsystem/meta_types/qt6quickstudioeventsystem_debug_metatypes.json.gen: /opt/homebrew/share/qt/libexec/moc
_deps/ds-build/src/imports/tools/eventsystem/meta_types/qt6quickstudioeventsystem_debug_metatypes.json.gen: _deps/ds-build/src/imports/tools/eventsystem/meta_types/QuickStudioEventSystem_json_file_list.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/mason/Documents/Code/dash-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Running moc --collect-json for target QuickStudioEventSystem"
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsystem && /opt/homebrew/share/qt/libexec/moc -o /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsystem/meta_types/qt6quickstudioeventsystem_debug_metatypes.json.gen --collect-json @/Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsystem/meta_types/QuickStudioEventSystem_json_file_list.txt
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsystem && /opt/homebrew/Cellar/cmake/3.27.8/bin/cmake -E copy_if_different /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsystem/meta_types/qt6quickstudioeventsystem_debug_metatypes.json.gen /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsystem/meta_types/qt6quickstudioeventsystem_debug_metatypes.json

QuickStudioEventSystem_qmltyperegistration: _deps/ds-build/src/imports/tools/eventsystem/CMakeFiles/QuickStudioEventSystem_qmltyperegistration
QuickStudioEventSystem_qmltyperegistration: _deps/ds-build/src/imports/tools/eventsystem/meta_types/qt6quickstudioeventsystem_debug_metatypes.json
QuickStudioEventSystem_qmltyperegistration: _deps/ds-build/src/imports/tools/eventsystem/meta_types/qt6quickstudioeventsystem_debug_metatypes.json.gen
QuickStudioEventSystem_qmltyperegistration: _deps/ds-build/src/imports/tools/eventsystem/quickstudioeventsystem_qmltyperegistrations.cpp
QuickStudioEventSystem_qmltyperegistration: qml/QtQuick/Studio/EventSystem/QuickStudioEventSystem.qmltypes
QuickStudioEventSystem_qmltyperegistration: _deps/ds-build/src/imports/tools/eventsystem/CMakeFiles/QuickStudioEventSystem_qmltyperegistration.dir/build.make
.PHONY : QuickStudioEventSystem_qmltyperegistration

# Rule to build all files generated by this target.
_deps/ds-build/src/imports/tools/eventsystem/CMakeFiles/QuickStudioEventSystem_qmltyperegistration.dir/build: QuickStudioEventSystem_qmltyperegistration
.PHONY : _deps/ds-build/src/imports/tools/eventsystem/CMakeFiles/QuickStudioEventSystem_qmltyperegistration.dir/build

_deps/ds-build/src/imports/tools/eventsystem/CMakeFiles/QuickStudioEventSystem_qmltyperegistration.dir/clean:
	cd /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsystem && $(CMAKE_COMMAND) -P CMakeFiles/QuickStudioEventSystem_qmltyperegistration.dir/cmake_clean.cmake
.PHONY : _deps/ds-build/src/imports/tools/eventsystem/CMakeFiles/QuickStudioEventSystem_qmltyperegistration.dir/clean

_deps/ds-build/src/imports/tools/eventsystem/CMakeFiles/QuickStudioEventSystem_qmltyperegistration.dir/depend:
	cd /Users/mason/Documents/Code/dash-cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/mason/Documents/Code/dash-cpp/Bolt_Dash /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-src/src/imports/tools/eventsystem /Users/mason/Documents/Code/dash-cpp/build /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsystem /Users/mason/Documents/Code/dash-cpp/build/_deps/ds-build/src/imports/tools/eventsystem/CMakeFiles/QuickStudioEventSystem_qmltyperegistration.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : _deps/ds-build/src/imports/tools/eventsystem/CMakeFiles/QuickStudioEventSystem_qmltyperegistration.dir/depend

