// SPDX-License-Identifier: Apache-2.0 OR MIT

use std::{env, fs, path::PathBuf};

fn main() {
    let out_dir = PathBuf::from(env::var("OUT_DIR").unwrap());
    let target = env::var("TARGET").unwrap();
    let name = env::var("CARGO_PKG_NAME").unwrap();

    if target.starts_with("armv7r-none-eabi") || target.starts_with("armebv7r-none-eabi") {
        fs::copy(
            format!("bin/{}.a", target),
            out_dir.join(format!("lib{}.a", name)),
        )
        .unwrap();
        println!("cargo:rustc-link-lib=static={}", name);
        println!("cargo:rustc-link-search={}", out_dir.display());
    }

    println!("cargo:rerun-if-changed=bin/armebv7r-none-eabi.a");
    println!("cargo:rerun-if-changed=bin/armv7r-none-eabi.a");
    println!("cargo:rerun-if-changed=bin/armebv7r-none-eabihf.a");
    println!("cargo:rerun-if-changed=bin/armv7r-none-eabihf.a");
    println!("cargo:rerun-if-changed=build.rs");
}
