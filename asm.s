// SPDX-License-Identifier: Apache-2.0 OR MIT

    .syntax unified
    .arm

    .section .text.__flash_ecc_enable
    .global __flash_ecc_enable
__flash_ecc_enable:
    mrc p15, #0x00, r0, c1, c0, #0x01
    orr r0, r0, #0x02000000
    mcr p15, #0x00, r0, c1, c0, #0x01
    bx lr

    .section .text.__flash_ecc_disable
    .global __flash_ecc_disable
__flash_ecc_disable:
    mrc p15, #0x00, r0, c1, c0, #0x01
    bic r0, r0, #0x02000000
    mcr p15, #0x00, r0, c1, c0, #0x01
    bx lr

    .section .text.__event_bus_export_enable
    .global __event_bus_export_enable
__event_bus_export_enable:
    mrc p15, #0x00, r0, c9, c12, #0x00
    orr r0, r0, #0x10
    mcr p15, #0x00, r0, c9, c12, #0x00
    bx lr

    .section .text.__event_bus_export_disable
    .global __event_bus_export_disable
__event_bus_export_disable:
    mrc p15, #0x00, r0, c9, c12, #0x00
    bic r0, r0, #0x10
    mcr p15, #0x00, r0, c9, c12, #0x00
    bx lr

    .section .text.__ram_ecc_enable
    .global __ram_ecc_enable
__ram_ecc_enable:
    mrc p15, #0x00, r0, c1, c0, #0x01
    orr r0, r0, #0x0C000000
    mcr p15, #0x00, r0, c1, c0, #0x01
    bx lr

    .section .text.__ram_ecc_disable
    .global __ram_ecc_disable
__ram_ecc_disable:
    mrc p15, #0x00, r0, c1, c0, #0x01
    bic r0, r0, #0x0C000000
    mcr p15, #0x00, r0, c1, c0, #0x01
    bx lr

    .section .text.__irq_vic_enable
    .global __irq_vic_enable
__irq_vic_enable:
    mrc p15, #0, r0, c1, c0, #0
    orr r0, r0, #0x01000000
    mcr p15, #0, r0, c1, c0, #0
    bx lr

    .section .text.__vfp_enable
    .global __vfp_enable
__vfp_enable:
.ifdef USE_VFP
    mrc  p15, #0x00, r0, c1, c0, #0x02
    orr  r0,  r0, #0xF00000
    mcr  p15, #0x00, r0, c1, c0, #0x02
    mov  r0,  #0x40000000
    fmxr fpexc,r0
    bx lr
.else
    bx lr
.endif

    .section .text.__idle_cpu
    .global __idle_cpu
__idle_cpu:
    wfi
    nop
    nop
    nop
    nop
    bx    lr

