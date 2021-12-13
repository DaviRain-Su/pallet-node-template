# pallet-ibc


## Check no_std

```

pallet-ibc  🍣 main 🛤️  ×1🦀 v1.58.0-nightly 🐏 7GiB/8GiB | 8GiB/9GiB
🕙 14:32:20 ❯ make check
cargo check --no-default-features --target=wasm32-unknown-unknown
    Checking sp-io v4.0.0-dev (https://github.com/paritytech/substrate.git?branch=polkadot-v0.9.12#d76f3999)
error[E0152]: found duplicate lang item `panic_impl`
    --> /Users/davirain/.cargo/git/checkouts/substrate-7e08433d4c370a21/d76f399/primitives/io/src/lib.rs:1484:1
     |
1484 | pub fn panic(info: &core::panic::PanicInfo) -> ! {
     | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     |
     = note: the lang item is first defined in crate `std` (which `parity_scale_codec` depends on)
     = note: first definition in `std` loaded from /Users/davirain/.rustup/toolchains/nightly-aarch64-apple-darwin/lib/rustlib/wasm32-unknown-unknown/lib/libstd-34bc94a57ca06760.rlib
     = note: second definition in the local crate (`sp_io`)

error[E0152]: found duplicate lang item `oom`
    --> /Users/davirain/.cargo/git/checkouts/substrate-7e08433d4c370a21/d76f399/primitives/io/src/lib.rs:1493:1
     |
1493 | pub fn oom(_: core::alloc::Layout) -> ! {
     | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     |
     = note: the lang item is first defined in crate `std` (which `parity_scale_codec` depends on)
     = note: first definition in `std` loaded from /Users/davirain/.rustup/toolchains/nightly-aarch64-apple-darwin/lib/rustlib/wasm32-unknown-unknown/lib/libstd-34bc94a57ca06760.rlib
     = note: second definition in the local crate (`sp_io`)

For more information about this error, try `rustc --explain E0152`.
error: could not compile `sp-io` due to 2 previous errors
make: *** [check] Error 101

```
