#!/bin/sh

export ARCH=arm64
export CROSS_COMPILE=../../gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
export CROSS_COMPILE_ARM32=../../gcc-linaro-7.5.0-2019.12-x86_64_armv8l-linux-gnueabihf/bin/armv8l-linux-gnueabihf-
export CLANG_TRIPLE=aarch64-linux-gnu-
mkdir -p build/modout

make -C "$(pwd)" O=build custom_defconfig
# make -C "$(pwd)" O=build menuconfig
make -C "$(pwd)" O=build -j3
make -C "$(pwd)" O=build INSTALL_MOD_PATH="modout" INSTALL_MOD_STRIP=1 modules_install
