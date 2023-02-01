# Sega Dreamcast Toolchains Maker (dc-chain)
# This file is part of KallistiOS.
#
# Created by Jim Ursetto (2004)
# Initially adapted from Stalin's build script version 0.3.
# Taken from KOS PR #90 (https://github.com/KallistiOS/KallistiOS/pull/90) 
# created by https://github.com/gyrovorbis
#

# Interesting targets (you can 'make' any of these):
# all: patch build
# patch: patch-gcc patch-newlib patch-kos
# build: build-sh4 build-arm
# build-sh4: build-sh4-binutils build-sh4-gcc
# build-arm: build-arm-binutils build-arm-gcc
# build-sh4-gcc: build-sh4-gcc-pass1 build-sh4-newlib build-sh4-gcc-pass2
# build-arm-gcc: build-arm-gcc-pass1
# build-sh4-newlib: build-sh4-newlib-only fixup-sh4-newlib
# gdb
# insight

# Toolchain versions for SH
sh_binutils_ver=2.35
sh_gcc_ver=12.2.0
newlib_ver=4.1.0
gdb_ver=9.2
insight_ver=6.8-1

# Tarball extensions to download for SH
sh_binutils_tarball_type=xz
sh_gcc_tarball_type=xz
newlib_tarball_type=gz
gdb_tarball_type=xz
insight_tarball_type=bz2

# Toolchain for ARM
# The ARM version of binutils/gcc is separated out as the particular CPU
# versions we need may not be available in newer versions of GCC.
arm_binutils_ver=2.34
arm_gcc_ver=8.4.0

# Tarball extensions to download for ARM
arm_binutils_tarball_type=xz
arm_gcc_tarball_type=xz

# GCC custom dependencies
# Specify here if you want to use custom GMP, MPFR and MPC libraries as they are
# required when building GCC. If you leave this variable commented, all 
# these dependencies will be automatically downloaded by using the provided 
# '/contrib/download_prerequisites' shell script from the GCC packages, which is
# recommended. The ISL dependency isn't mandatory; if you don't want it, you may 
# just comment the version numbers (i.e. 'sh_isl_ver' and 'arm_isl_ver') to
# disable the ISL library.
#use_custom_dependencies=1

# Internal custom GCC libraries (i.e. GMP, MPFR, MPC and ISL) versions to use
# only if the 'use_custom_dependencies' flag is set to '1'.

# GCC dependencies for SH
sh_gmp_ver=6.1.0
sh_mpfr_ver=3.1.4
sh_mpc_ver=1.0.3
sh_isl_ver=0.18

# Tarball extensions to download for GCC dependencies for SH
sh_gmp_tarball_type=bz2
sh_mpfr_tarball_type=bz2
sh_mpc_tarball_type=gz
sh_isl_tarball_type=bz2

# GCC dependencies for ARM
arm_gmp_ver=6.1.0
arm_mpfr_ver=3.1.4
arm_mpc_ver=1.0.3
arm_isl_ver=0.18

# Tarball extensions to download for GCC dependencies for ARM
arm_gmp_tarball_type=bz2
arm_mpfr_tarball_type=bz2
arm_mpc_tarball_type=gz
arm_isl_tarball_type=bz2

# Toolchains base
# Indicate the root directory where toolchains will be installed
# This should match your 'environ.sh' configuration
toolchains_base=/opt/toolchains/dc-rust

# Erase (1|0)
# Erase build directories on the fly to save space
erase=1

# Verbose (1|0)
# Display output to screen as well as log files
verbose=1

# Make jobs (-jn|<empty>)
# Set this value to -jn where n is the number of jobs you want to run with make.
# If you only want one job, just set this to nothing (i.e, "makejobs=").
# Tracking down problems with multiple make jobs is much more difficult than
# with just one running at a time. So, if you run into trouble, then you should
# clear this variable and try again with just one job running.
# Please note, this value may be overriden in some cases; as issues were
# detected on some OS.
makejobs=-j$(nproc)

# Languages (c|c++|objc|obj-c++)
# Set the languages to build for pass 2 of building gcc for sh-elf. The default
# here is to build C, C++, Objective C, and Objective C++. You may want to take
# out the latter two if you're not worried about them and/or you're short on
# hard drive space.
pass2_languages=c,c++,rust,

# Download protocol (http|https|ftp)
# Specify here the protocol you want to use for downloading the packages.
download_protocol=https

# Force downloader (curl|wget)
# You may specify here 'wget' or 'curl'. If this variable is empty or commented,
# web downloader tool will be auto-detected in the following order: cURL, Wget.
# You must have either Wget or cURL installed to use dc-chain.
#force_downloader=wget

# GCC threading model (single|kos|posix*)
# With GCC 4.x versions and up, the patches provide a 'kos' thread model, so you 
# should use it. If you really don't want threading support for C++ (or 
# Objective C/Objective C++), you can set this to 'single'. With GCC 3.x, you 
# probably want 'posix' here; but this mode is deprecated as the GCC 3.x branch
# is not anymore supported.
thread_model=single

# Install mode (install-strip|install)
# Use 'install-strip' mode for removing debugging symbols of the toolchains.
# Use 'install' only if you want to enable debug symbols for the toolchains.
# This may be useful only if you plan to debug the toolchain itself.
install_mode=install-strip

# MinGW/MSYS
# Standalone binaries (1|0)
# Define this if you want a standalone, no dependency binaries (i.e. static)
# When the binaries are standalone, it can be run outside MinGW/MSYS
# environment. This is NOT recommended. Use it if you know what you are doing.
#standalone_binary=1

# Automatic fixup SH-4 Newlib (1|0)
# Uncomment this if you want to disable the automatic fixup sh4 newlib needed by
# KallistiOS. This will keep the generated toolchain completely raw. This will
# also disable the 'kos' thread model. Don't mess with that flag unless you know
# exactly what you are doing.
auto_fixup_sh4_newlib=0
