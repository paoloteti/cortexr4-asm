// SPDX-License-Identifier: Apache-2.0 OR MIT

    .syntax unified
    .arm

// Enable interrupts - R4 IRQ & FIQ
    .section .text.__enable_interrupt
    .weak __enable_interrupt
    .type __enable_interrupt, %function
__enable_interrupt:
    cpsie if
    bx lr

// Disable interrupts - R4 IRQ & FIQ
    .section .text.__disable_interrupt
    .weak __disable_interrupt
    .type __disable_interrupt, %function
__disable_interrupt:
    cpsid if
    bx lr

// Enable IRQ interrupt
    .section .text.__enable_IRQ_interrupt
    .weak __enable_IRQ_interrupt
    .type __enable_IRQ_interrupt, %function
__enable_IRQ_interrupt:
    cpsie i
    bx lr

// Disable IRQ interrupt
    .section .text.__disable_IRQ_interrupt
    .weak __disable_IRQ_interrupt
    .type __disable_IRQ_interrupt, %function
__disable_IRQ_interrupt:
    cpsid i
    bx lr

// Enable FIQ interrupt
    .section .text.__enable_FIQ_interrupt
    .weak __enable_FIQ_interrupt
    .type __enable_FIQ_interrupt, %function
__enable_FIQ_interrupt:
    cpsie f
    bx lr

// Disable FIQ interrupt
    .section .text.__disable_FIQ_interrupt
    .weak __disable_FIQ_interrupt
    .type __disable_FIQ_interrupt, %function
__disable_FIQ_interrupt:
    cpsid f
    bx lr
