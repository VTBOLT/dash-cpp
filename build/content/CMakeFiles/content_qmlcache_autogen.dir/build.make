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

# Utility rule file for content_qmlcache_autogen.

# Include any custom commands dependencies for this target.
include content/CMakeFiles/content_qmlcache_autogen.dir/compiler_depend.make

# Include the progress variables for this target.
include content/CMakeFiles/content_qmlcache_autogen.dir/progress.make

content/CMakeFiles/content_qmlcache_autogen: content/.rcc/qmlcache/content_qmlcache_loader.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/mason/Documents/Code/dash-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic MOC and UIC for target content_qmlcache"
	cd /Users/mason/Documents/Code/dash-cpp/build/content && /opt/homebrew/Cellar/cmake/3.27.8/bin/cmake -E cmake_autogen /Users/mason/Documents/Code/dash-cpp/build/content/CMakeFiles/content_qmlcache_autogen.dir/AutogenInfo.json Debug

content/.rcc/qmlcache/content_qmlcache_loader.cpp: /opt/homebrew/share/qt/libexec/qmlcachegen
content/.rcc/qmlcache/content_qmlcache_loader.cpp: content/.rcc/qmlcache/content_qml_loader_file_list.rsp
content/.rcc/qmlcache/content_qmlcache_loader.cpp: content/.rcc/qmake_content.qrc
content/.rcc/qmlcache/content_qmlcache_loader.cpp: content/.rcc/content_raw_qml_0.qrc
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/mason/Documents/Code/dash-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating .rcc/qmlcache/content_qmlcache_loader.cpp"
	cd /Users/mason/Documents/Code/dash-cpp/build/content && /opt/homebrew/share/qt/libexec/qmlcachegen --resource-name qmlcache_content --resource /Users/mason/Documents/Code/dash-cpp/build/content/.rcc/qmake_content.qrc --resource /Users/mason/Documents/Code/dash-cpp/build/content/.rcc/content_raw_qml_0.qrc -o /Users/mason/Documents/Code/dash-cpp/build/content/.rcc/qmlcache/content_qmlcache_loader.cpp @/Users/mason/Documents/Code/dash-cpp/build/content/.rcc/qmlcache/content_qml_loader_file_list.rsp

content_qmlcache_autogen: content/.rcc/qmlcache/content_qmlcache_loader.cpp
content_qmlcache_autogen: content/CMakeFiles/content_qmlcache_autogen
content_qmlcache_autogen: content/CMakeFiles/content_qmlcache_autogen.dir/build.make
.PHONY : content_qmlcache_autogen

# Rule to build all files generated by this target.
content/CMakeFiles/content_qmlcache_autogen.dir/build: content_qmlcache_autogen
.PHONY : content/CMakeFiles/content_qmlcache_autogen.dir/build

content/CMakeFiles/content_qmlcache_autogen.dir/clean:
	cd /Users/mason/Documents/Code/dash-cpp/build/content && $(CMAKE_COMMAND) -P CMakeFiles/content_qmlcache_autogen.dir/cmake_clean.cmake
.PHONY : content/CMakeFiles/content_qmlcache_autogen.dir/clean

content/CMakeFiles/content_qmlcache_autogen.dir/depend:
	cd /Users/mason/Documents/Code/dash-cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/mason/Documents/Code/dash-cpp/Bolt_Dash /Users/mason/Documents/Code/dash-cpp/Bolt_Dash/content /Users/mason/Documents/Code/dash-cpp/build /Users/mason/Documents/Code/dash-cpp/build/content /Users/mason/Documents/Code/dash-cpp/build/content/CMakeFiles/content_qmlcache_autogen.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : content/CMakeFiles/content_qmlcache_autogen.dir/depend

