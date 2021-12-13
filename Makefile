install:
	# Install
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

	# Configure
	source ~/.cargo/env

	rustup default nightly
	rustup update
	rustup update nightly
	rustup target add wasm32-unknown-unknown --toolchain nightly

check:
	cargo check --no-default-features --target=wasm32-unknown-unknown
