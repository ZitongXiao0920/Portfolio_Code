# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

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
CMAKE_COMMAND = /Users/zitongxiao/Desktop/CMake.app/Contents/bin/cmake

# The command to remove a file.
RM = /Users/zitongxiao/Desktop/CMake.app/Contents/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/zitongxiao/Desktop/NewTemplateHW2b

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/zitongxiao/Desktop/NewTemplateHW2b/bin

# Include any dependencies generated for this target.
include CMakeFiles/HW2b.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/HW2b.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/HW2b.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/HW2b.dir/flags.make

CMakeFiles/HW2b.dir/src/main.cpp.o: CMakeFiles/HW2b.dir/flags.make
CMakeFiles/HW2b.dir/src/main.cpp.o: /Users/zitongxiao/Desktop/NewTemplateHW2b/src/main.cpp
CMakeFiles/HW2b.dir/src/main.cpp.o: CMakeFiles/HW2b.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zitongxiao/Desktop/NewTemplateHW2b/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/HW2b.dir/src/main.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/HW2b.dir/src/main.cpp.o -MF CMakeFiles/HW2b.dir/src/main.cpp.o.d -o CMakeFiles/HW2b.dir/src/main.cpp.o -c /Users/zitongxiao/Desktop/NewTemplateHW2b/src/main.cpp

CMakeFiles/HW2b.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HW2b.dir/src/main.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/zitongxiao/Desktop/NewTemplateHW2b/src/main.cpp > CMakeFiles/HW2b.dir/src/main.cpp.i

CMakeFiles/HW2b.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HW2b.dir/src/main.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/zitongxiao/Desktop/NewTemplateHW2b/src/main.cpp -o CMakeFiles/HW2b.dir/src/main.cpp.s

CMakeFiles/HW2b.dir/ext/glad/src/glad.c.o: CMakeFiles/HW2b.dir/flags.make
CMakeFiles/HW2b.dir/ext/glad/src/glad.c.o: /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glad/src/glad.c
CMakeFiles/HW2b.dir/ext/glad/src/glad.c.o: CMakeFiles/HW2b.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zitongxiao/Desktop/NewTemplateHW2b/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/HW2b.dir/ext/glad/src/glad.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/HW2b.dir/ext/glad/src/glad.c.o -MF CMakeFiles/HW2b.dir/ext/glad/src/glad.c.o.d -o CMakeFiles/HW2b.dir/ext/glad/src/glad.c.o -c /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glad/src/glad.c

CMakeFiles/HW2b.dir/ext/glad/src/glad.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/HW2b.dir/ext/glad/src/glad.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glad/src/glad.c > CMakeFiles/HW2b.dir/ext/glad/src/glad.c.i

CMakeFiles/HW2b.dir/ext/glad/src/glad.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/HW2b.dir/ext/glad/src/glad.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glad/src/glad.c -o CMakeFiles/HW2b.dir/ext/glad/src/glad.c.s

# Object files for target HW2b
HW2b_OBJECTS = \
"CMakeFiles/HW2b.dir/src/main.cpp.o" \
"CMakeFiles/HW2b.dir/ext/glad/src/glad.c.o"

# External object files for target HW2b
HW2b_EXTERNAL_OBJECTS =

HW2b: CMakeFiles/HW2b.dir/src/main.cpp.o
HW2b: CMakeFiles/HW2b.dir/ext/glad/src/glad.c.o
HW2b: CMakeFiles/HW2b.dir/build.make
HW2b: ext/glfw/src/libglfw.3.4.dylib
HW2b: CMakeFiles/HW2b.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/zitongxiao/Desktop/NewTemplateHW2b/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable HW2b"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/HW2b.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/HW2b.dir/build: HW2b
.PHONY : CMakeFiles/HW2b.dir/build

CMakeFiles/HW2b.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/HW2b.dir/cmake_clean.cmake
.PHONY : CMakeFiles/HW2b.dir/clean

CMakeFiles/HW2b.dir/depend:
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/zitongxiao/Desktop/NewTemplateHW2b /Users/zitongxiao/Desktop/NewTemplateHW2b /Users/zitongxiao/Desktop/NewTemplateHW2b/bin /Users/zitongxiao/Desktop/NewTemplateHW2b/bin /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/CMakeFiles/HW2b.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/HW2b.dir/depend
