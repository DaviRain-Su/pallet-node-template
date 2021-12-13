# 测试一个pallet-node-template 是否支持no_std


这个项目是用来测试pallet-node-template是否支持no_std,

使用 `cargo check --no-default-features --target=wasm32-unknown-unknown` 用来测试一个pallet是否支持no_std.

这是询问parity上的作者回答的解决办法:https://github.com/paritytech/substrate/issues/10477

这里说需要将 Cargo.toml中的version替换成2021，  **use edition = "2021" instead of edition = "2018"**。


## 第一种测试pallet是否支持no_std的方法，Check no_std


这是之前没有修改version的版本编译出错的情况。 
成功的情况下应该是在version = "2021"的情况下，使用`cargo check --no-default-features --target=wasm32-unknown-unknown` 
测试是否支持no_std.

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


## 第二种方式测试pallet支持no_std的方式使用`substrate-wasm-builder`

通过添加`substrate-wasm-builder`来帮助测试一个pallet是否支持no_std.

1. 在Cargo.toml的 [package] 中添加build = "build.rs" 键值对。
2. 在Cato.toml中添加substrate-wasm-builder依赖
```shell
[build-dependencies.substrate-wasm-builder]
branch = 'polkadot-v0.9.12'
git    = 'https://github.com/paritytech/substrate.git'
```
3.在项目的顶层目录中添加build.rs文件，以及内容。
```rust
use substrate_wasm_builder::WasmBuilder;

fn main() {
    WasmBuilder::new()
        .with_current_project()
        .export_heap_base()
        .import_memory()
        .build()
}
```
