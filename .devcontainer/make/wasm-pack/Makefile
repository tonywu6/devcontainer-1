WASM_PACK_VERSION ?= 0.13.0

.PHONY: all
all:

	git clone https://github.com/rustwasm/wasm-pack \
		--branch v$(WASM_PACK_VERSION) \
		--depth 1 \
		/tmp/git/wasm-pack

	cargo zigbuild \
		--target $(ZIGBUILD_TARGET) \
		--release \
		--manifest-path /tmp/git/wasm-pack/Cargo.toml \
		--bin wasm-pack

	mv /tmp/git/wasm-pack/target/$(RUSTC_TARGET)/release/wasm-pack $(CARGO_HOME)/bin/wasm-pack

ifndef RUSTC_TARGET
	$(error RUSTC_TARGET is not set)
endif

ifndef ZIGBUILD_TARGET
	$(error ZIGBUILD_TARGET is not set)
endif

ifndef CARGO_HOME
	$(error CARGO_HOME is not set)
endif
