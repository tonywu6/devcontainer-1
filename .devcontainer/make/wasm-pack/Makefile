WASM_PACK_VERSION ?= 0.12.1

.PHONY: all
all:

	cargo install wasm-pack \
		--version $(WASM_PACK_VERSION) \
		--target $(RUST_TARGET)

ifndef RUST_TARGET
	$(error RUST_TARGET is not set)
endif
