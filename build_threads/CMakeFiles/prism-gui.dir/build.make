# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.7

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/aj/hdd1/clion/PRISM

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/aj/hdd1/clion/PRISM/build_threads

# Include any dependencies generated for this target.
include CMakeFiles/prism-gui.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/prism-gui.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/prism-gui.dir/flags.make

CMakeFiles/prism.dir/include/prism_generated_Multislice.cu.o: CMakeFiles/prism.dir/include/prism_generated_Multislice.cu.o.depend
CMakeFiles/prism.dir/include/prism_generated_Multislice.cu.o: CMakeFiles/prism.dir/include/prism_generated_Multislice.cu.o.cmake
CMakeFiles/prism.dir/include/prism_generated_Multislice.cu.o: ../include/Multislice.cu
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/aj/hdd1/clion/PRISM/build_threads/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building NVCC (Device) object CMakeFiles/prism.dir/include/prism_generated_Multislice.cu.o"
	cd /home/aj/hdd1/clion/PRISM/build_threads/CMakeFiles/prism.dir/include && /usr/local/bin/cmake -E make_directory /home/aj/hdd1/clion/PRISM/build_threads/CMakeFiles/prism.dir/include/.
	cd /home/aj/hdd1/clion/PRISM/build_threads/CMakeFiles/prism.dir/include && /usr/local/bin/cmake -D verbose:BOOL=$(VERBOSE) -D build_configuration:STRING= -D generated_file:STRING=/home/aj/hdd1/clion/PRISM/build_threads/CMakeFiles/prism.dir/include/./prism_generated_Multislice.cu.o -D generated_cubin_file:STRING=/home/aj/hdd1/clion/PRISM/build_threads/CMakeFiles/prism.dir/include/./prism_generated_Multislice.cu.o.cubin.txt -P /home/aj/hdd1/clion/PRISM/build_threads/CMakeFiles/prism.dir/include/prism_generated_Multislice.cu.o.cmake

CMakeFiles/prism-gui.dir/include/prism-gui_generated_Multislice.cu.o: CMakeFiles/prism-gui.dir/include/prism-gui_generated_Multislice.cu.o.depend
CMakeFiles/prism-gui.dir/include/prism-gui_generated_Multislice.cu.o: CMakeFiles/prism-gui.dir/include/prism-gui_generated_Multislice.cu.o.cmake
CMakeFiles/prism-gui.dir/include/prism-gui_generated_Multislice.cu.o: ../include/Multislice.cu
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/aj/hdd1/clion/PRISM/build_threads/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building NVCC (Device) object CMakeFiles/prism-gui.dir/include/prism-gui_generated_Multislice.cu.o"
	cd /home/aj/hdd1/clion/PRISM/build_threads/CMakeFiles/prism-gui.dir/include && /usr/local/bin/cmake -E make_directory /home/aj/hdd1/clion/PRISM/build_threads/CMakeFiles/prism-gui.dir/include/.
	cd /home/aj/hdd1/clion/PRISM/build_threads/CMakeFiles/prism-gui.dir/include && /usr/local/bin/cmake -D verbose:BOOL=$(VERBOSE) -D build_configuration:STRING= -D generated_file:STRING=/home/aj/hdd1/clion/PRISM/build_threads/CMakeFiles/prism-gui.dir/include/./prism-gui_generated_Multislice.cu.o -D generated_cubin_file:STRING=/home/aj/hdd1/clion/PRISM/build_threads/CMakeFiles/prism-gui.dir/include/./prism-gui_generated_Multislice.cu.o.cubin.txt -P /home/aj/hdd1/clion/PRISM/build_threads/CMakeFiles/prism-gui.dir/include/prism-gui_generated_Multislice.cu.o.cmake

CMakeFiles/prism-gui.dir/Qt/main.cpp.o: CMakeFiles/prism-gui.dir/flags.make
CMakeFiles/prism-gui.dir/Qt/main.cpp.o: ../Qt/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/aj/hdd1/clion/PRISM/build_threads/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/prism-gui.dir/Qt/main.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/prism-gui.dir/Qt/main.cpp.o -c /home/aj/hdd1/clion/PRISM/Qt/main.cpp

CMakeFiles/prism-gui.dir/Qt/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/prism-gui.dir/Qt/main.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/aj/hdd1/clion/PRISM/Qt/main.cpp > CMakeFiles/prism-gui.dir/Qt/main.cpp.i

CMakeFiles/prism-gui.dir/Qt/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/prism-gui.dir/Qt/main.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/aj/hdd1/clion/PRISM/Qt/main.cpp -o CMakeFiles/prism-gui.dir/Qt/main.cpp.s

CMakeFiles/prism-gui.dir/Qt/main.cpp.o.requires:

.PHONY : CMakeFiles/prism-gui.dir/Qt/main.cpp.o.requires

CMakeFiles/prism-gui.dir/Qt/main.cpp.o.provides: CMakeFiles/prism-gui.dir/Qt/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/prism-gui.dir/build.make CMakeFiles/prism-gui.dir/Qt/main.cpp.o.provides.build
.PHONY : CMakeFiles/prism-gui.dir/Qt/main.cpp.o.provides

CMakeFiles/prism-gui.dir/Qt/main.cpp.o.provides.build: CMakeFiles/prism-gui.dir/Qt/main.cpp.o


CMakeFiles/prism-gui.dir/Qt/prismmainwindow.cpp.o: CMakeFiles/prism-gui.dir/flags.make
CMakeFiles/prism-gui.dir/Qt/prismmainwindow.cpp.o: ../Qt/prismmainwindow.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/aj/hdd1/clion/PRISM/build_threads/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/prism-gui.dir/Qt/prismmainwindow.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/prism-gui.dir/Qt/prismmainwindow.cpp.o -c /home/aj/hdd1/clion/PRISM/Qt/prismmainwindow.cpp

CMakeFiles/prism-gui.dir/Qt/prismmainwindow.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/prism-gui.dir/Qt/prismmainwindow.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/aj/hdd1/clion/PRISM/Qt/prismmainwindow.cpp > CMakeFiles/prism-gui.dir/Qt/prismmainwindow.cpp.i

CMakeFiles/prism-gui.dir/Qt/prismmainwindow.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/prism-gui.dir/Qt/prismmainwindow.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/aj/hdd1/clion/PRISM/Qt/prismmainwindow.cpp -o CMakeFiles/prism-gui.dir/Qt/prismmainwindow.cpp.s

CMakeFiles/prism-gui.dir/Qt/prismmainwindow.cpp.o.requires:

.PHONY : CMakeFiles/prism-gui.dir/Qt/prismmainwindow.cpp.o.requires

CMakeFiles/prism-gui.dir/Qt/prismmainwindow.cpp.o.provides: CMakeFiles/prism-gui.dir/Qt/prismmainwindow.cpp.o.requires
	$(MAKE) -f CMakeFiles/prism-gui.dir/build.make CMakeFiles/prism-gui.dir/Qt/prismmainwindow.cpp.o.provides.build
.PHONY : CMakeFiles/prism-gui.dir/Qt/prismmainwindow.cpp.o.provides

CMakeFiles/prism-gui.dir/Qt/prismmainwindow.cpp.o.provides.build: CMakeFiles/prism-gui.dir/Qt/prismmainwindow.cpp.o


CMakeFiles/prism-gui.dir/configure.cpp.o: CMakeFiles/prism-gui.dir/flags.make
CMakeFiles/prism-gui.dir/configure.cpp.o: ../configure.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/aj/hdd1/clion/PRISM/build_threads/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/prism-gui.dir/configure.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/prism-gui.dir/configure.cpp.o -c /home/aj/hdd1/clion/PRISM/configure.cpp

CMakeFiles/prism-gui.dir/configure.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/prism-gui.dir/configure.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/aj/hdd1/clion/PRISM/configure.cpp > CMakeFiles/prism-gui.dir/configure.cpp.i

CMakeFiles/prism-gui.dir/configure.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/prism-gui.dir/configure.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/aj/hdd1/clion/PRISM/configure.cpp -o CMakeFiles/prism-gui.dir/configure.cpp.s

CMakeFiles/prism-gui.dir/configure.cpp.o.requires:

.PHONY : CMakeFiles/prism-gui.dir/configure.cpp.o.requires

CMakeFiles/prism-gui.dir/configure.cpp.o.provides: CMakeFiles/prism-gui.dir/configure.cpp.o.requires
	$(MAKE) -f CMakeFiles/prism-gui.dir/build.make CMakeFiles/prism-gui.dir/configure.cpp.o.provides.build
.PHONY : CMakeFiles/prism-gui.dir/configure.cpp.o.provides

CMakeFiles/prism-gui.dir/configure.cpp.o.provides.build: CMakeFiles/prism-gui.dir/configure.cpp.o


CMakeFiles/prism-gui.dir/prism-gui_automoc.cpp.o: CMakeFiles/prism-gui.dir/flags.make
CMakeFiles/prism-gui.dir/prism-gui_automoc.cpp.o: prism-gui_automoc.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/aj/hdd1/clion/PRISM/build_threads/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/prism-gui.dir/prism-gui_automoc.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/prism-gui.dir/prism-gui_automoc.cpp.o -c /home/aj/hdd1/clion/PRISM/build_threads/prism-gui_automoc.cpp

CMakeFiles/prism-gui.dir/prism-gui_automoc.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/prism-gui.dir/prism-gui_automoc.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/aj/hdd1/clion/PRISM/build_threads/prism-gui_automoc.cpp > CMakeFiles/prism-gui.dir/prism-gui_automoc.cpp.i

CMakeFiles/prism-gui.dir/prism-gui_automoc.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/prism-gui.dir/prism-gui_automoc.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/aj/hdd1/clion/PRISM/build_threads/prism-gui_automoc.cpp -o CMakeFiles/prism-gui.dir/prism-gui_automoc.cpp.s

CMakeFiles/prism-gui.dir/prism-gui_automoc.cpp.o.requires:

.PHONY : CMakeFiles/prism-gui.dir/prism-gui_automoc.cpp.o.requires

CMakeFiles/prism-gui.dir/prism-gui_automoc.cpp.o.provides: CMakeFiles/prism-gui.dir/prism-gui_automoc.cpp.o.requires
	$(MAKE) -f CMakeFiles/prism-gui.dir/build.make CMakeFiles/prism-gui.dir/prism-gui_automoc.cpp.o.provides.build
.PHONY : CMakeFiles/prism-gui.dir/prism-gui_automoc.cpp.o.provides

CMakeFiles/prism-gui.dir/prism-gui_automoc.cpp.o.provides.build: CMakeFiles/prism-gui.dir/prism-gui_automoc.cpp.o


# Object files for target prism-gui
prism__gui_OBJECTS = \
"CMakeFiles/prism-gui.dir/Qt/main.cpp.o" \
"CMakeFiles/prism-gui.dir/Qt/prismmainwindow.cpp.o" \
"CMakeFiles/prism-gui.dir/configure.cpp.o" \
"CMakeFiles/prism-gui.dir/prism-gui_automoc.cpp.o"

# External object files for target prism-gui
prism__gui_EXTERNAL_OBJECTS = \
"/home/aj/hdd1/clion/PRISM/build_threads/CMakeFiles/prism-gui.dir/include/prism-gui_generated_Multislice.cu.o"

prism-gui: CMakeFiles/prism-gui.dir/Qt/main.cpp.o
prism-gui: CMakeFiles/prism-gui.dir/Qt/prismmainwindow.cpp.o
prism-gui: CMakeFiles/prism-gui.dir/configure.cpp.o
prism-gui: CMakeFiles/prism-gui.dir/prism-gui_automoc.cpp.o
prism-gui: CMakeFiles/prism-gui.dir/include/prism-gui_generated_Multislice.cu.o
prism-gui: CMakeFiles/prism-gui.dir/build.make
prism-gui: /usr/local/cuda-8.0/lib64/libcudart_static.a
prism-gui: /usr/lib/x86_64-linux-gnu/librt.so
prism-gui: /usr/local/cuda-8.0/lib64/libcufft.so
prism-gui: /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5.5.1
prism-gui: /usr/local/lib/libfftw3.so
prism-gui: /usr/lib/x86_64-linux-gnu/librt.so
prism-gui: /usr/local/cuda-8.0/lib64/libcufft.so
prism-gui: /usr/local/lib/libfftw3.so
prism-gui: /usr/lib/x86_64-linux-gnu/libQt5Gui.so.5.5.1
prism-gui: /usr/lib/x86_64-linux-gnu/libQt5Core.so.5.5.1
prism-gui: CMakeFiles/prism-gui.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/aj/hdd1/clion/PRISM/build_threads/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX executable prism-gui"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/prism-gui.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/prism-gui.dir/build: prism-gui

.PHONY : CMakeFiles/prism-gui.dir/build

CMakeFiles/prism-gui.dir/requires: CMakeFiles/prism-gui.dir/Qt/main.cpp.o.requires
CMakeFiles/prism-gui.dir/requires: CMakeFiles/prism-gui.dir/Qt/prismmainwindow.cpp.o.requires
CMakeFiles/prism-gui.dir/requires: CMakeFiles/prism-gui.dir/configure.cpp.o.requires
CMakeFiles/prism-gui.dir/requires: CMakeFiles/prism-gui.dir/prism-gui_automoc.cpp.o.requires

.PHONY : CMakeFiles/prism-gui.dir/requires

CMakeFiles/prism-gui.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/prism-gui.dir/cmake_clean.cmake
.PHONY : CMakeFiles/prism-gui.dir/clean

CMakeFiles/prism-gui.dir/depend: CMakeFiles/prism.dir/include/prism_generated_Multislice.cu.o
CMakeFiles/prism-gui.dir/depend: CMakeFiles/prism-gui.dir/include/prism-gui_generated_Multislice.cu.o
	cd /home/aj/hdd1/clion/PRISM/build_threads && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/aj/hdd1/clion/PRISM /home/aj/hdd1/clion/PRISM /home/aj/hdd1/clion/PRISM/build_threads /home/aj/hdd1/clion/PRISM/build_threads /home/aj/hdd1/clion/PRISM/build_threads/CMakeFiles/prism-gui.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/prism-gui.dir/depend

