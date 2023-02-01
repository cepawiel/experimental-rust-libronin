# Rust on Dreamcast
This uses GCCRS with no std/core library at this time. If you know how
or manage to compile either let me know I'd be excited to know how! GCCRS
does not fully support Rust at the moment, so keep that in mind should you 
decide to modify the example.


## How to Build
Only build dependency is Docker
Just run "./build.sh" to compile toolchain followed by libronin and
the Rust example (libronin/examples/ex_rust.rs). The output elf 
(libronin/examples/ex_rust.elf) will be located alongside the source 
file. Tested working on both lxdream-nitro and Dreamcast Hardware 
using dcload-ip.

## Sources
[GCCRS](https://github.com/Rust-GCC/gccrs)

[libronin](https://github.com/Rust-GCC/gccrs/issues/869)

[KallistiOS](https://github.com/KallistiOS/KallistiOS)

[dc-chain Toolchain File](https://github.com/KallistiOS/KallistiOS/pull/90)