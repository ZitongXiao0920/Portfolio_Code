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
include ext/glfw/src/CMakeFiles/glfw.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include ext/glfw/src/CMakeFiles/glfw.dir/compiler_depend.make

# Include the progress variables for this target.
include ext/glfw/src/CMakeFiles/glfw.dir/progress.make

# Include the compile flags for this target's objects.
include ext/glfw/src/CMakeFiles/glfw.dir/flags.make

ext/glfw/src/CMakeFiles/glfw.dir/context.c.o: ext/glfw/src/CMakeFiles/glfw.dir/flags.make
ext/glfw/src/CMakeFiles/glfw.dir/context.c.o: /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/context.c
ext/glfw/src/CMakeFiles/glfw.dir/context.c.o: ext/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zitongxiao/Desktop/NewTemplateHW2b/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object ext/glfw/src/CMakeFiles/glfw.dir/context.c.o"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -Wdeclaration-after-statement -MD -MT ext/glfw/src/CMakeFiles/glfw.dir/context.c.o -MF CMakeFiles/glfw.dir/context.c.o.d -o CMakeFiles/glfw.dir/context.c.o -c /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/context.c

ext/glfw/src/CMakeFiles/glfw.dir/context.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/context.c.i"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -Wdeclaration-after-statement -E /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/context.c > CMakeFiles/glfw.dir/context.c.i

ext/glfw/src/CMakeFiles/glfw.dir/context.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/context.c.s"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -Wdeclaration-after-statement -S /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/context.c -o CMakeFiles/glfw.dir/context.c.s

ext/glfw/src/CMakeFiles/glfw.dir/init.c.o: ext/glfw/src/CMakeFiles/glfw.dir/flags.make
ext/glfw/src/CMakeFiles/glfw.dir/init.c.o: /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/init.c
ext/glfw/src/CMakeFiles/glfw.dir/init.c.o: ext/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zitongxiao/Desktop/NewTemplateHW2b/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object ext/glfw/src/CMakeFiles/glfw.dir/init.c.o"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -Wdeclaration-after-statement -MD -MT ext/glfw/src/CMakeFiles/glfw.dir/init.c.o -MF CMakeFiles/glfw.dir/init.c.o.d -o CMakeFiles/glfw.dir/init.c.o -c /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/init.c

ext/glfw/src/CMakeFiles/glfw.dir/init.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/init.c.i"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -Wdeclaration-after-statement -E /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/init.c > CMakeFiles/glfw.dir/init.c.i

ext/glfw/src/CMakeFiles/glfw.dir/init.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/init.c.s"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -Wdeclaration-after-statement -S /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/init.c -o CMakeFiles/glfw.dir/init.c.s

ext/glfw/src/CMakeFiles/glfw.dir/input.c.o: ext/glfw/src/CMakeFiles/glfw.dir/flags.make
ext/glfw/src/CMakeFiles/glfw.dir/input.c.o: /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/input.c
ext/glfw/src/CMakeFiles/glfw.dir/input.c.o: ext/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zitongxiao/Desktop/NewTemplateHW2b/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object ext/glfw/src/CMakeFiles/glfw.dir/input.c.o"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -Wdeclaration-after-statement -MD -MT ext/glfw/src/CMakeFiles/glfw.dir/input.c.o -MF CMakeFiles/glfw.dir/input.c.o.d -o CMakeFiles/glfw.dir/input.c.o -c /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/input.c

ext/glfw/src/CMakeFiles/glfw.dir/input.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/input.c.i"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -Wdeclaration-after-statement -E /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/input.c > CMakeFiles/glfw.dir/input.c.i

ext/glfw/src/CMakeFiles/glfw.dir/input.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/input.c.s"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -Wdeclaration-after-statement -S /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/input.c -o CMakeFiles/glfw.dir/input.c.s

ext/glfw/src/CMakeFiles/glfw.dir/monitor.c.o: ext/glfw/src/CMakeFiles/glfw.dir/flags.make
ext/glfw/src/CMakeFiles/glfw.dir/monitor.c.o: /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/monitor.c
ext/glfw/src/CMakeFiles/glfw.dir/monitor.c.o: ext/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zitongxiao/Desktop/NewTemplateHW2b/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object ext/glfw/src/CMakeFiles/glfw.dir/monitor.c.o"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -Wdeclaration-after-statement -MD -MT ext/glfw/src/CMakeFiles/glfw.dir/monitor.c.o -MF CMakeFiles/glfw.dir/monitor.c.o.d -o CMakeFiles/glfw.dir/monitor.c.o -c /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/monitor.c

ext/glfw/src/CMakeFiles/glfw.dir/monitor.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/monitor.c.i"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -Wdeclaration-after-statement -E /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/monitor.c > CMakeFiles/glfw.dir/monitor.c.i

ext/glfw/src/CMakeFiles/glfw.dir/monitor.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/monitor.c.s"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -Wdeclaration-after-statement -S /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/monitor.c -o CMakeFiles/glfw.dir/monitor.c.s

ext/glfw/src/CMakeFiles/glfw.dir/vulkan.c.o: ext/glfw/src/CMakeFiles/glfw.dir/flags.make
ext/glfw/src/CMakeFiles/glfw.dir/vulkan.c.o: /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/vulkan.c
ext/glfw/src/CMakeFiles/glfw.dir/vulkan.c.o: ext/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zitongxiao/Desktop/NewTemplateHW2b/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object ext/glfw/src/CMakeFiles/glfw.dir/vulkan.c.o"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -Wdeclaration-after-statement -MD -MT ext/glfw/src/CMakeFiles/glfw.dir/vulkan.c.o -MF CMakeFiles/glfw.dir/vulkan.c.o.d -o CMakeFiles/glfw.dir/vulkan.c.o -c /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/vulkan.c

ext/glfw/src/CMakeFiles/glfw.dir/vulkan.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/vulkan.c.i"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -Wdeclaration-after-statement -E /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/vulkan.c > CMakeFiles/glfw.dir/vulkan.c.i

ext/glfw/src/CMakeFiles/glfw.dir/vulkan.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/vulkan.c.s"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -Wdeclaration-after-statement -S /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/vulkan.c -o CMakeFiles/glfw.dir/vulkan.c.s

ext/glfw/src/CMakeFiles/glfw.dir/window.c.o: ext/glfw/src/CMakeFiles/glfw.dir/flags.make
ext/glfw/src/CMakeFiles/glfw.dir/window.c.o: /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/window.c
ext/glfw/src/CMakeFiles/glfw.dir/window.c.o: ext/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zitongxiao/Desktop/NewTemplateHW2b/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object ext/glfw/src/CMakeFiles/glfw.dir/window.c.o"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -Wdeclaration-after-statement -MD -MT ext/glfw/src/CMakeFiles/glfw.dir/window.c.o -MF CMakeFiles/glfw.dir/window.c.o.d -o CMakeFiles/glfw.dir/window.c.o -c /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/window.c

ext/glfw/src/CMakeFiles/glfw.dir/window.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/window.c.i"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -Wdeclaration-after-statement -E /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/window.c > CMakeFiles/glfw.dir/window.c.i

ext/glfw/src/CMakeFiles/glfw.dir/window.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/window.c.s"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -Wdeclaration-after-statement -S /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/window.c -o CMakeFiles/glfw.dir/window.c.s

ext/glfw/src/CMakeFiles/glfw.dir/cocoa_init.m.o: ext/glfw/src/CMakeFiles/glfw.dir/flags.make
ext/glfw/src/CMakeFiles/glfw.dir/cocoa_init.m.o: /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/cocoa_init.m
ext/glfw/src/CMakeFiles/glfw.dir/cocoa_init.m.o: ext/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zitongxiao/Desktop/NewTemplateHW2b/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object ext/glfw/src/CMakeFiles/glfw.dir/cocoa_init.m.o"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT ext/glfw/src/CMakeFiles/glfw.dir/cocoa_init.m.o -MF CMakeFiles/glfw.dir/cocoa_init.m.o.d -o CMakeFiles/glfw.dir/cocoa_init.m.o -c /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/cocoa_init.m

ext/glfw/src/CMakeFiles/glfw.dir/cocoa_init.m.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/cocoa_init.m.i"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/cocoa_init.m > CMakeFiles/glfw.dir/cocoa_init.m.i

ext/glfw/src/CMakeFiles/glfw.dir/cocoa_init.m.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/cocoa_init.m.s"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/cocoa_init.m -o CMakeFiles/glfw.dir/cocoa_init.m.s

ext/glfw/src/CMakeFiles/glfw.dir/cocoa_joystick.m.o: ext/glfw/src/CMakeFiles/glfw.dir/flags.make
ext/glfw/src/CMakeFiles/glfw.dir/cocoa_joystick.m.o: /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/cocoa_joystick.m
ext/glfw/src/CMakeFiles/glfw.dir/cocoa_joystick.m.o: ext/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zitongxiao/Desktop/NewTemplateHW2b/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object ext/glfw/src/CMakeFiles/glfw.dir/cocoa_joystick.m.o"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT ext/glfw/src/CMakeFiles/glfw.dir/cocoa_joystick.m.o -MF CMakeFiles/glfw.dir/cocoa_joystick.m.o.d -o CMakeFiles/glfw.dir/cocoa_joystick.m.o -c /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/cocoa_joystick.m

ext/glfw/src/CMakeFiles/glfw.dir/cocoa_joystick.m.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/cocoa_joystick.m.i"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/cocoa_joystick.m > CMakeFiles/glfw.dir/cocoa_joystick.m.i

ext/glfw/src/CMakeFiles/glfw.dir/cocoa_joystick.m.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/cocoa_joystick.m.s"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/cocoa_joystick.m -o CMakeFiles/glfw.dir/cocoa_joystick.m.s

ext/glfw/src/CMakeFiles/glfw.dir/cocoa_monitor.m.o: ext/glfw/src/CMakeFiles/glfw.dir/flags.make
ext/glfw/src/CMakeFiles/glfw.dir/cocoa_monitor.m.o: /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/cocoa_monitor.m
ext/glfw/src/CMakeFiles/glfw.dir/cocoa_monitor.m.o: ext/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zitongxiao/Desktop/NewTemplateHW2b/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object ext/glfw/src/CMakeFiles/glfw.dir/cocoa_monitor.m.o"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT ext/glfw/src/CMakeFiles/glfw.dir/cocoa_monitor.m.o -MF CMakeFiles/glfw.dir/cocoa_monitor.m.o.d -o CMakeFiles/glfw.dir/cocoa_monitor.m.o -c /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/cocoa_monitor.m

ext/glfw/src/CMakeFiles/glfw.dir/cocoa_monitor.m.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/cocoa_monitor.m.i"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/cocoa_monitor.m > CMakeFiles/glfw.dir/cocoa_monitor.m.i

ext/glfw/src/CMakeFiles/glfw.dir/cocoa_monitor.m.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/cocoa_monitor.m.s"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/cocoa_monitor.m -o CMakeFiles/glfw.dir/cocoa_monitor.m.s

ext/glfw/src/CMakeFiles/glfw.dir/cocoa_window.m.o: ext/glfw/src/CMakeFiles/glfw.dir/flags.make
ext/glfw/src/CMakeFiles/glfw.dir/cocoa_window.m.o: /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/cocoa_window.m
ext/glfw/src/CMakeFiles/glfw.dir/cocoa_window.m.o: ext/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zitongxiao/Desktop/NewTemplateHW2b/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object ext/glfw/src/CMakeFiles/glfw.dir/cocoa_window.m.o"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT ext/glfw/src/CMakeFiles/glfw.dir/cocoa_window.m.o -MF CMakeFiles/glfw.dir/cocoa_window.m.o.d -o CMakeFiles/glfw.dir/cocoa_window.m.o -c /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/cocoa_window.m

ext/glfw/src/CMakeFiles/glfw.dir/cocoa_window.m.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/cocoa_window.m.i"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/cocoa_window.m > CMakeFiles/glfw.dir/cocoa_window.m.i

ext/glfw/src/CMakeFiles/glfw.dir/cocoa_window.m.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/cocoa_window.m.s"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/cocoa_window.m -o CMakeFiles/glfw.dir/cocoa_window.m.s

ext/glfw/src/CMakeFiles/glfw.dir/cocoa_time.c.o: ext/glfw/src/CMakeFiles/glfw.dir/flags.make
ext/glfw/src/CMakeFiles/glfw.dir/cocoa_time.c.o: /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/cocoa_time.c
ext/glfw/src/CMakeFiles/glfw.dir/cocoa_time.c.o: ext/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zitongxiao/Desktop/NewTemplateHW2b/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object ext/glfw/src/CMakeFiles/glfw.dir/cocoa_time.c.o"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT ext/glfw/src/CMakeFiles/glfw.dir/cocoa_time.c.o -MF CMakeFiles/glfw.dir/cocoa_time.c.o.d -o CMakeFiles/glfw.dir/cocoa_time.c.o -c /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/cocoa_time.c

ext/glfw/src/CMakeFiles/glfw.dir/cocoa_time.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/cocoa_time.c.i"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/cocoa_time.c > CMakeFiles/glfw.dir/cocoa_time.c.i

ext/glfw/src/CMakeFiles/glfw.dir/cocoa_time.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/cocoa_time.c.s"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/cocoa_time.c -o CMakeFiles/glfw.dir/cocoa_time.c.s

ext/glfw/src/CMakeFiles/glfw.dir/posix_thread.c.o: ext/glfw/src/CMakeFiles/glfw.dir/flags.make
ext/glfw/src/CMakeFiles/glfw.dir/posix_thread.c.o: /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/posix_thread.c
ext/glfw/src/CMakeFiles/glfw.dir/posix_thread.c.o: ext/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zitongxiao/Desktop/NewTemplateHW2b/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object ext/glfw/src/CMakeFiles/glfw.dir/posix_thread.c.o"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT ext/glfw/src/CMakeFiles/glfw.dir/posix_thread.c.o -MF CMakeFiles/glfw.dir/posix_thread.c.o.d -o CMakeFiles/glfw.dir/posix_thread.c.o -c /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/posix_thread.c

ext/glfw/src/CMakeFiles/glfw.dir/posix_thread.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/posix_thread.c.i"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/posix_thread.c > CMakeFiles/glfw.dir/posix_thread.c.i

ext/glfw/src/CMakeFiles/glfw.dir/posix_thread.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/posix_thread.c.s"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/posix_thread.c -o CMakeFiles/glfw.dir/posix_thread.c.s

ext/glfw/src/CMakeFiles/glfw.dir/nsgl_context.m.o: ext/glfw/src/CMakeFiles/glfw.dir/flags.make
ext/glfw/src/CMakeFiles/glfw.dir/nsgl_context.m.o: /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/nsgl_context.m
ext/glfw/src/CMakeFiles/glfw.dir/nsgl_context.m.o: ext/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zitongxiao/Desktop/NewTemplateHW2b/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object ext/glfw/src/CMakeFiles/glfw.dir/nsgl_context.m.o"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT ext/glfw/src/CMakeFiles/glfw.dir/nsgl_context.m.o -MF CMakeFiles/glfw.dir/nsgl_context.m.o.d -o CMakeFiles/glfw.dir/nsgl_context.m.o -c /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/nsgl_context.m

ext/glfw/src/CMakeFiles/glfw.dir/nsgl_context.m.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/nsgl_context.m.i"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/nsgl_context.m > CMakeFiles/glfw.dir/nsgl_context.m.i

ext/glfw/src/CMakeFiles/glfw.dir/nsgl_context.m.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/nsgl_context.m.s"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/nsgl_context.m -o CMakeFiles/glfw.dir/nsgl_context.m.s

ext/glfw/src/CMakeFiles/glfw.dir/egl_context.c.o: ext/glfw/src/CMakeFiles/glfw.dir/flags.make
ext/glfw/src/CMakeFiles/glfw.dir/egl_context.c.o: /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/egl_context.c
ext/glfw/src/CMakeFiles/glfw.dir/egl_context.c.o: ext/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zitongxiao/Desktop/NewTemplateHW2b/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object ext/glfw/src/CMakeFiles/glfw.dir/egl_context.c.o"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT ext/glfw/src/CMakeFiles/glfw.dir/egl_context.c.o -MF CMakeFiles/glfw.dir/egl_context.c.o.d -o CMakeFiles/glfw.dir/egl_context.c.o -c /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/egl_context.c

ext/glfw/src/CMakeFiles/glfw.dir/egl_context.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/egl_context.c.i"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/egl_context.c > CMakeFiles/glfw.dir/egl_context.c.i

ext/glfw/src/CMakeFiles/glfw.dir/egl_context.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/egl_context.c.s"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/egl_context.c -o CMakeFiles/glfw.dir/egl_context.c.s

ext/glfw/src/CMakeFiles/glfw.dir/osmesa_context.c.o: ext/glfw/src/CMakeFiles/glfw.dir/flags.make
ext/glfw/src/CMakeFiles/glfw.dir/osmesa_context.c.o: /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/osmesa_context.c
ext/glfw/src/CMakeFiles/glfw.dir/osmesa_context.c.o: ext/glfw/src/CMakeFiles/glfw.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zitongxiao/Desktop/NewTemplateHW2b/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building C object ext/glfw/src/CMakeFiles/glfw.dir/osmesa_context.c.o"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT ext/glfw/src/CMakeFiles/glfw.dir/osmesa_context.c.o -MF CMakeFiles/glfw.dir/osmesa_context.c.o.d -o CMakeFiles/glfw.dir/osmesa_context.c.o -c /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/osmesa_context.c

ext/glfw/src/CMakeFiles/glfw.dir/osmesa_context.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glfw.dir/osmesa_context.c.i"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/osmesa_context.c > CMakeFiles/glfw.dir/osmesa_context.c.i

ext/glfw/src/CMakeFiles/glfw.dir/osmesa_context.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glfw.dir/osmesa_context.c.s"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src/osmesa_context.c -o CMakeFiles/glfw.dir/osmesa_context.c.s

# Object files for target glfw
glfw_OBJECTS = \
"CMakeFiles/glfw.dir/context.c.o" \
"CMakeFiles/glfw.dir/init.c.o" \
"CMakeFiles/glfw.dir/input.c.o" \
"CMakeFiles/glfw.dir/monitor.c.o" \
"CMakeFiles/glfw.dir/vulkan.c.o" \
"CMakeFiles/glfw.dir/window.c.o" \
"CMakeFiles/glfw.dir/cocoa_init.m.o" \
"CMakeFiles/glfw.dir/cocoa_joystick.m.o" \
"CMakeFiles/glfw.dir/cocoa_monitor.m.o" \
"CMakeFiles/glfw.dir/cocoa_window.m.o" \
"CMakeFiles/glfw.dir/cocoa_time.c.o" \
"CMakeFiles/glfw.dir/posix_thread.c.o" \
"CMakeFiles/glfw.dir/nsgl_context.m.o" \
"CMakeFiles/glfw.dir/egl_context.c.o" \
"CMakeFiles/glfw.dir/osmesa_context.c.o"

# External object files for target glfw
glfw_EXTERNAL_OBJECTS =

ext/glfw/src/libglfw.3.4.dylib: ext/glfw/src/CMakeFiles/glfw.dir/context.c.o
ext/glfw/src/libglfw.3.4.dylib: ext/glfw/src/CMakeFiles/glfw.dir/init.c.o
ext/glfw/src/libglfw.3.4.dylib: ext/glfw/src/CMakeFiles/glfw.dir/input.c.o
ext/glfw/src/libglfw.3.4.dylib: ext/glfw/src/CMakeFiles/glfw.dir/monitor.c.o
ext/glfw/src/libglfw.3.4.dylib: ext/glfw/src/CMakeFiles/glfw.dir/vulkan.c.o
ext/glfw/src/libglfw.3.4.dylib: ext/glfw/src/CMakeFiles/glfw.dir/window.c.o
ext/glfw/src/libglfw.3.4.dylib: ext/glfw/src/CMakeFiles/glfw.dir/cocoa_init.m.o
ext/glfw/src/libglfw.3.4.dylib: ext/glfw/src/CMakeFiles/glfw.dir/cocoa_joystick.m.o
ext/glfw/src/libglfw.3.4.dylib: ext/glfw/src/CMakeFiles/glfw.dir/cocoa_monitor.m.o
ext/glfw/src/libglfw.3.4.dylib: ext/glfw/src/CMakeFiles/glfw.dir/cocoa_window.m.o
ext/glfw/src/libglfw.3.4.dylib: ext/glfw/src/CMakeFiles/glfw.dir/cocoa_time.c.o
ext/glfw/src/libglfw.3.4.dylib: ext/glfw/src/CMakeFiles/glfw.dir/posix_thread.c.o
ext/glfw/src/libglfw.3.4.dylib: ext/glfw/src/CMakeFiles/glfw.dir/nsgl_context.m.o
ext/glfw/src/libglfw.3.4.dylib: ext/glfw/src/CMakeFiles/glfw.dir/egl_context.c.o
ext/glfw/src/libglfw.3.4.dylib: ext/glfw/src/CMakeFiles/glfw.dir/osmesa_context.c.o
ext/glfw/src/libglfw.3.4.dylib: ext/glfw/src/CMakeFiles/glfw.dir/build.make
ext/glfw/src/libglfw.3.4.dylib: ext/glfw/src/CMakeFiles/glfw.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/zitongxiao/Desktop/NewTemplateHW2b/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Linking C shared library libglfw.dylib"
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/glfw.dir/link.txt --verbose=$(VERBOSE)
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && $(CMAKE_COMMAND) -E cmake_symlink_library libglfw.3.4.dylib libglfw.3.dylib libglfw.dylib

ext/glfw/src/libglfw.3.dylib: ext/glfw/src/libglfw.3.4.dylib
	@$(CMAKE_COMMAND) -E touch_nocreate ext/glfw/src/libglfw.3.dylib

ext/glfw/src/libglfw.dylib: ext/glfw/src/libglfw.3.4.dylib
	@$(CMAKE_COMMAND) -E touch_nocreate ext/glfw/src/libglfw.dylib

# Rule to build all files generated by this target.
ext/glfw/src/CMakeFiles/glfw.dir/build: ext/glfw/src/libglfw.dylib
.PHONY : ext/glfw/src/CMakeFiles/glfw.dir/build

ext/glfw/src/CMakeFiles/glfw.dir/clean:
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src && $(CMAKE_COMMAND) -P CMakeFiles/glfw.dir/cmake_clean.cmake
.PHONY : ext/glfw/src/CMakeFiles/glfw.dir/clean

ext/glfw/src/CMakeFiles/glfw.dir/depend:
	cd /Users/zitongxiao/Desktop/NewTemplateHW2b/bin && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/zitongxiao/Desktop/NewTemplateHW2b /Users/zitongxiao/Desktop/NewTemplateHW2b/ext/glfw/src /Users/zitongxiao/Desktop/NewTemplateHW2b/bin /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src /Users/zitongxiao/Desktop/NewTemplateHW2b/bin/ext/glfw/src/CMakeFiles/glfw.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ext/glfw/src/CMakeFiles/glfw.dir/depend

