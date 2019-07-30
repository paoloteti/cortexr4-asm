#!/bin/bash

set -euxo pipefail

main() {
    local crate=cortex-r4-asm

    local asmfile="asm.s cpustack.s init_reg.s"

    rm -f bin/*.a

    arm-none-eabi-as -march=armv7-r -mlittle-endian -mfloat-abi=soft $asmfile -o bin/$crate.o
    ar crs bin/armv7r-none-eabi.a bin/$crate.o

    arm-none-eabi-as -march=armv7-r -mbig-endian -mfloat-abi=soft $asmfile -o bin/$crate.o
    ar crs bin/armebv7r-none-eabi.a bin/$crate.o

    arm-none-eabi-as -march=armv7-r -mlittle-endian -mfloat-abi=hard -mfpu=vfpv3-d16 $asmfile \
                     -o bin/$crate.o --defsym USE_VFP=1
    ar crs bin/armv7r-none-eabihf.a bin/$crate.o

    arm-none-eabi-as -march=armv7-r -mbig-endian -mfloat-abi=hard -mfpu=vfpv3-d16 $asmfile \
                     -o bin/$crate.o --defsym USE_VFP=1
    ar crs bin/armebv7r-none-eabihf.a bin/$crate.o

    rm bin/$crate.o
}

main
