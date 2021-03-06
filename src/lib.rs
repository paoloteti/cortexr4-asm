// SPDX-License-Identifier: Apache-2.0 OR MIT

//! Collection of Assembly function for ARM Cortex R4/R4F MCUs
#![deny(missing_docs)]
#![deny(warnings)]
#![no_std]

/// Initialize Stack pointers in all CPU working modes.
#[inline(always)]
pub unsafe fn init_stack_pointers() {
    extern "C" {
        fn _cpu_stack();
    }
    _cpu_stack()
}

/// Initialize Core registers, including floating point, in all
/// CPU working modes.
/// This function is andatory to avoid any lock-step compare
/// failure at startup or at first mode switch.
#[inline(always)]
pub unsafe fn init_core_registers() {
    extern "C" {
        fn __init_core_registers();
    }
    __init_core_registers()
}

/// Enable Flash ECC
#[inline]
pub unsafe fn flash_ecc_enable() {
    extern "C" {
        fn __flash_ecc_enable();
    }
    __flash_ecc_enable()
}

/// Disable Flash ECC
#[inline]
pub unsafe fn flash_ecc_disable() {
    extern "C" {
        fn __flash_ecc_disable();
    }
    __flash_ecc_disable()
}

/// Enable Event Bus notifications
#[inline]
pub unsafe fn event_bus_export_enable() {
    extern "C" {
        fn __event_bus_export_enable();
    }
    __event_bus_export_enable()
}

/// Disable Event Bus notifications
#[inline]
pub unsafe fn event_bus_export_disable() {
    extern "C" {
        fn __event_bus_export_disable();
    }
    __event_bus_export_disable()
}

/// Enable RAM ECC
#[inline]
pub unsafe fn ram_ecc_enable() {
    extern "C" {
        fn __ram_ecc_enable();
    }
    __ram_ecc_enable()
}

/// Disable RAM ECC
#[inline]
pub unsafe fn ram_ecc_disable() {
    extern "C" {
        fn __ram_ecc_disable();
    }
    __ram_ecc_disable()
}

/// Enable Vectored Interrupt
#[inline]
pub unsafe fn irq_vic_enable() {
    extern "C" {
        fn __irq_vic_enable();
    }
    __irq_vic_enable()
}

/// Enable VFP coprocessor to supports floating point arithmetic operations
/// VFP implements the ARM VFPv3 floating point coprocessor instruction set.
#[inline]
pub unsafe fn vfp_enable() {
    extern "C" {
        fn __vfp_enable();
    }
    __vfp_enable()
}

/// Take CPU to IDLE state
#[inline]
pub unsafe fn idle_cpu() {
    extern "C" {
        fn __idle_cpu();
    }
    __idle_cpu()
}

/// Wrappers to oneline assembly functions
pub mod asm {
    /// Add a NOP istruction
    #[inline(always)]
    pub fn nop() {
        extern "C" {
            fn __nop();
        }
        unsafe { __nop() }
    }

    /// Enable interrupts - R4 IRQ & FIQ
    #[inline]
    pub unsafe fn enable_interrupt() {
        extern "C" {
            fn __enable_interrupt();
        }
        __enable_interrupt()
    }

    /// Disable interrupts - R4 IRQ & FIQ
    #[inline]
    pub unsafe fn disable_interrupt() {
        extern "C" {
            fn __disable_interrupt();
        }
        __disable_interrupt()
    }

    /// Enable IRQ interrupt
    #[inline]
    pub unsafe fn enable_irq_interrupt() {
        extern "C" {
            fn __enable_IRQ_interrupt();
        }
        __enable_IRQ_interrupt()
    }

    /// Disable IRQ interrupt
    #[inline]
    pub unsafe fn disable_irq_interrupt() {
        extern "C" {
            fn __disable_IRQ_interrupt();
        }
        __disable_IRQ_interrupt()
    }

    /// Enable FIQ interrupt
    #[inline]
    pub unsafe fn enable_fiq_interrupt() {
        extern "C" {
            fn __enable_FIQ_interrupt();
        }
        __enable_FIQ_interrupt()
    }

    /// Disable FIQ interrupt
    #[inline]
    pub unsafe fn disable_fiq_interrupt() {
        extern "C" {
            fn __disable_FIQ_interrupt();
        }
        __disable_FIQ_interrupt()
    }
}
