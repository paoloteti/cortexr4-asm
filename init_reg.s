
// SPDX-License-Identifier: Apache-2.0 OR MIT

    .syntax unified
    .arm

    .weak __init_core_registers
    .type __init_core_registers, %function
    .section .text.__init_core_registers
__init_core_registers:
    /* After reset, the CPU is in the Supervisor mode (M = 10011) */
    mov r0, lr
    mov r1, #0x0000
    mov r2, #0x0000
    mov r3, #0x0000
    mov r4, #0x0000
    mov r5, #0x0000
    mov r6, #0x0000
    mov r7, #0x0000
    mov r8, #0x0000
    mov r9, #0x0000
    mov r10, #0x0000
    mov r11, #0x0000
    mov r12, #0x0000
    mov r13, #0x0000
    mrs r1, cpsr
    msr spsr_cxsf, r1

    /* Switch to FIQ mode (M = 10001) */
    cps #17
    mov lr, r0
    mov r8, #0x0000
    mov r9, #0x0000
    mov r10, #0x0000
    mov r11, #0x0000
    mov r12, #0x0000
    mrs r1, cpsr
    msr spsr_cxsf, r1

    /* Switch to IRQ mode (M = 10010) */
    cps #18
    mov lr, r0
    mrs r1,cpsr
    msr spsr_cxsf, r1

    /* Switch to Abort mode (M = 10111) */
    cps #23
    mov lr, r0
    mrs r1,cpsr
    msr spsr_cxsf, r1

    /* Switch to Undefined Instruction Mode (M = 11011) */
    cps #27
    mov lr, r0
    mrs r1,cpsr
    msr spsr_cxsf, r1

    /* Switch to System Mode (Shares User Mode registers) (M = 11111) */
    cps #31
    mov lr, r0
    mrs r1,cpsr
    msr spsr_cxsf, r1

.ifdef USE_VFP
    mrc   p15,     #0x00,      r2,       c1, c0, #0x02
    orr   r2,      r2,         #0xF00000
    mcr   p15,     #0x00,      r2,       c1, c0, #0x02
    mov   r2,      #0x40000000
    fmxr  fpexc,   r2

    fmdrr d0, r1, r1
    fmdrr d1, r1, r1
    fmdrr d2, r1, r1
    fmdrr d3, r1, r1
    fmdrr d4, r1, r1
    fmdrr d5, r1, r1
    fmdrr d6, r1, r1
    fmdrr d7, r1, r1
    fmdrr d8, r1, r1
    fmdrr d9, r1, r1
    fmdrr d10, r1, r1
    fmdrr d11, r1, r1
    fmdrr d12, r1, r1
    fmdrr d13, r1, r1
    fmdrr d14, r1, r1
    fmdrr d15, r1, r1
.endif

    bl    1f
1:  bl    2f
2:  bl    3f
3:  bl    4f
4:  bx r0
