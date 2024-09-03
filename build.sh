#!/bin/bash

git clone https://github.com/ARM-software/arm-trusted-firmware.git
git clone https://github.com/OP-TEE/optee_os.git

cd arm-trusted-firmware
git checkout 18faaa2424208fc6dc6e4b66dddb529b09b30bef
patch -p1 < ../0001-Add-capability-to-load-bl32-from-0x20000.patch
make CROSS_COMPILE=aarch64-linux-gnu- PLAT=rpi4 DEBUG=1 SPD=opteed

cd ../optee_os
git checkout fa31123d515ca87c772eff94749a366fbff47758
patch -p1 < ../0001-Add-support-for-rpi4.patch
make   CROSS_COMPILE64=aarch64-linux-gnu-   PLATFORM=rpi4   CFG_ARM64_core=y   CFG_USER_TA_TARGETS=ta_arm64   CFG_DT=y CFG_CORE_ARM64_PA_BITS=33 -j

cp ../arm-trusted-firmware/build/rpi4/debug/bl31.bin bl31-pad.tmp
truncate --size=128K bl31-pad.tmp
cat bl31-pad.tmp out/arm-plat-rpi4/core/tee-pager_v2.bin > bl31-optee.bin
