## Raspberry Pi with ARM Trusted Firmware and OP-TEE

## Why do we need ATF?
Certain features of the Linux kernel, such as kexec on ARM64, may not function as intended without the support of the ARM Trusted Firmware (ATF). For instance, in the case of [vaultboot](https://github.com/hardenedvault/vaultboot), only one CPU core remains operational after the handover from vaultboot to the Linux distro kernel via kexec, while the other cores are suspended. To ensure full support for the Linux kernel, it is essential for ATF to be loaded at BL31.

## Why do we need OP-TEE? 
OP-TEE OS provides a Trusted Execution Environment (TEE), which enhances security by isolating sensitive operations and data from the host OS (e.g: GNU/Linux). This isolation helps protect against various attacks and vulnerabilities. Supporting OP-TEE on the Raspberry Pi simplifies the process of customizing OP-TEE based Trusted Applications (TAs). This flexibility allows developers to easily modify and adapt TAs to meet their specific requirements.

## Build TF-A and OP-TEE for RPI 4
```
# ./build.sh
...
...
# ls optee_os/bl31-optee.bin 
optee_os/bl31-optee.bin
```

Reference: [OPTEE-RPI4](https://github.com/joaopeixoto13/OPTEE-RPI4)

## Boot logs
```
Read start4.elf bytes  2257216 hnd 0x000050d8 
Read fixup4.dat bytes     5436 hnd 0x000001ab 
Firmware: 4942b7633c0ff1af1ee95a51a33b56a9dae47529 May 24 2024 15:30:04
0x00d03114 0x00000000 0x00001fff
MEM GPU: 76 ARM: 948 TOTAL: 1024
Starting start4.elf @ 0xfec00200 partition 0
PCI reset
+

MESS:00:00:03.542886:0: arasan: arasan_emmc_open
MESS:00:00:03.544544:0: arasan: arasan_emmc_set_clock C0: 0x00800000 C1: 0x000e0047 emmc: 200000000 actual: 390625 div: 0x00000100 target: 400000 min: 400000 max: 400000 delay: 5
MESS:00:00:03.664772:0: arasan: arasan_emmc_set_clock C0: 0x00800000 C1: 0x000e0047 emmc: 200000000 actual: 390625 div: 0x00000100 target: 400000 min: 400000 max: 400000 delay: 5
MESS:00:00:03.677641:0: arasan: arasan_emmc_set_clock C0: 0x00800f00 C1: 0x000e0047 emmc: 200000000 actual: 390625 div: 0x00000100 target: 400000 min: 390000 max: 400000 delay: 5
MESS:00:00:03.715194:0: arasan: arasan_emmc_set_clock C0: 0x00800f06 C1: 0x000e0207 emmc: 200000000 actual: 50000000 div: 0x00000002 target: 50000000 min: 0 max: 50000000 delay: 1
MESS:00:00:03.874461:0: brfs: File read: /mfs/sd/config.txt
MESS:00:00:03.877687:0: brfs: File read: 1315 bytes
MESS:00:00:03.902936:0: HDMI0:EDID error reading EDID block 0 attempt 0
MESS:00:00:03.907445:0: HDMI0:EDID giving up on reading EDID block 0
MESS:00:00:03.924191:0: HDMI1:EDID error reading EDID block 0 attempt 0
MESS:00:00:03.928694:0: HDMI1:EDID giving up on reading EDID block 0
MESS:00:00:03.935811:0: brfs: File read: /mfs/sd/config.txt
MESS:00:00:04.713400:0: gpioman: gpioman_get_pin_num: pin DISPLAY_DSI_PORT not defined
MESS:00:00:04.720360:0: *** Restart logging
MESS:00:00:04.722116:0: brfs: File read: 1315 bytes
MESS:00:00:04.732182:0: hdmi: HDMI0:EDID error reading EDID block 0 attempt 0
MESS:00:00:04.737205:0: hdmi: HDMI0:EDID giving up on reading EDID block 0
MESS:00:00:04.747829:0: hdmi: HDMI0:EDID error reading EDID block 0 attempt 0
MESS:00:00:04.752858:0: hdmi: HDMI0:EDID giving up on reading EDID block 0
MESS:00:00:04.758457:0: hdmi: HDMI:hdmi_get_state is deprecated, use hdmi_get_display_state instead
MESS:00:00:04.772248:0: hdmi: HDMI1:EDID error reading EDID block 0 attempt 0
MESS:00:00:04.777278:0: hdmi: HDMI1:EDID giving up on reading EDID block 0
MESS:00:00:04.787900:0: hdmi: HDMI1:EDID error reading EDID block 0 attempt 0
MESS:00:00:04.792921:0: hdmi: HDMI1:EDID giving up on reading EDID block 0
MESS:00:00:04.798519:0: hdmi: HDMI:hdmi_get_state is deprecated, use hdmi_get_display_state instead
MESS:00:00:04.807284:0: HDMI0: hdmi_pixel_encoding: 300000000
MESS:00:00:04.812752:0: HDMI1: hdmi_pixel_encoding: 300000000
MESS:00:00:06.297090:0: brfs: File read: /mfs/sd/initramfs8
MESS:00:00:06.299549:0: Loaded 'initramfs8' to 0x0 size 0x10c9f41
MESS:00:00:06.319025:0: initramfs loaded to 0x2df36000 (size 0x10c9f41)
MESS:00:00:06.331970:0: dtb_file 'bcm2711-rpi-4-b.dtb'
MESS:00:00:06.334000:0: brfs: File read: 17604417 bytes
MESS:00:00:06.345444:0: brfs: File read: /mfs/sd/bcm2711-rpi-4-b.dtb
MESS:00:00:06.348685:0: Loaded 'bcm2711-rpi-4-b.dtb' to 0x100 size 0xd9fc
MESS:00:00:06.368894:0: brfs: File read: 55804 bytes
MESS:00:00:06.383542:0: brfs: File read: /mfs/sd/overlays/overlay_map.dtb
MESS:00:00:06.409272:0: brfs: File read: 5255 bytes
MESS:00:00:06.413550:0: brfs: File read: /mfs/sd/config.txt
MESS:00:00:06.416435:0: dtparam: audio=on
MESS:00:00:06.425257:0: brfs: File read: 1315 bytes
MESS:00:00:06.446161:0: brfs: File read: /mfs/sd/overlays/vc4-kms-v3d-pi4.dtbo
MESS:00:00:06.513122:0: Loaded overlay 'vc4-kms-v3d-pi4'
MESS:00:00:06.682446:0: brfs: File read: 3913 bytes
MESS:00:00:06.688914:0: brfs: File read: /mfs/sd/cmdline.txt
MESS:00:00:06.691495:0: Read command line from file 'cmdline.txt':
MESS:00:00:06.697365:0: 'console=tty1 console=ttyS0,115200 root=PARTUUID=75d6d1b4-02 rootfstype=ext4 fsck.repair=yes rootwait quiet splash plymouth.ignore-serial-consoles'
MESS:00:00:06.837142:0: brfs: File read: 146 bytes
MESS:00:00:06.895049:0: brfs: File read: /mfs/sd/bl31-optee.bin
MESS:00:00:06.897853:0: Loaded 'bl31-optee.bin' to 0x0 size 0x92e08
MESS:00:00:06.903860:0: brfs: File read: 601608 bytes
MESS:00:00:07.687145:0: brfs: File read: /mfs/sd/kernel8.img
MESS:00:00:07.689703:0: Loaded 'kernel8.img' to 0x200000 size 0x8d8bd7
MESS:00:00:09.005579:0: Device tree loaded to 0x2df28100 (size 0xde98)
MESS:00:00:09.011003:0: uart: Set PL011 baud rate to 103448.300000 Hz
MESS:00:00:09.018070:0: uart: Baud rate change done...
MESS:00:00:09.020092:0:NOTICE:  BL31: v2.11.0(debug):v2.10.0-1389-g18faaa242-dirty
NOTICE:  BL31: Built : 10:35:17, Sep  3 2024
INFO:    ARM GICv2 driver initialized
INFO:    Changed device tree to advertise PSCI.
INFO:    BL31: Initializing runtime services
INFO:    BL31: cortex_a72: CPU workaround for erratum 859971 was applied
WARNING: BL31: cortex_a72: CPU workaround for erratum 1319367 was missing!
INFO:    BL31: cortex_a72: CPU workaround for CVE 2017_5715 was applied
INFO:    BL31: cortex_a72: CPU workaround for CVE 2018_3639 was applied
INFO:    BL31: cortex_a72: CPU workaround for CVE 2022_23960 was applied
INFO:    BL31: Initializing BL32
I/TC: 
I/TC: No non-secure external DT
I/TC: OP-TEE version: 4.3.0-71-gfa31123d5 (gcc version 13.2.0 (Ubuntu 13.2.0-23ubuntu4)) #1 Tue Sep  3 09:37:29 UTC 2024 aarch64
I/TC: WARNING: This OP-TEE configuration might be insecure!
I/TC: WARNING: Please check https://optee.readthedocs.io/en/latest/architecture/porting_guidelines.html
I/TC: Primary CPU initializing
I/TC: Primary CPU switching to normal world boot
INFO:    BL31: Preparing for EL3 exit to normal world
INFO:    Entry point address = 0x200000
INFO:    SPSR = 0x3c9
I/TC: Secondary CPU 1 initializing
I/TC: Secondary CPU 1 switching to normal world boot
I/TC: Secondary CPU 2 initializing
I/TC: Secondary CPU 2 switching to normal world boot
I/TC: Secondary CPU 3 initializing
I/TC: Secondary CPU 3 switching to normal world boot

Debian GNU/Linux 12 raspberrypi ttyS0

raspberrypi login:
```
