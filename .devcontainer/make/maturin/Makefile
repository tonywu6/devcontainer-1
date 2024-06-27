MATURIN_VERSION ?= 1.6.0

.PHONY: all
all:

	cargo install maturin \
		--version $(MATURIN_VERSION) \
		--target $(RUST_TARGET)

ifndef RUST_TARGET
	$(error RUST_TARGET is not set)
endif
