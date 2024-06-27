RYE_VERSION ?= 0.35.0

.PHONY: all
all:

	cargo install rye \
		--git https://github.com/astral-sh/rye \
		--version $(RYE_VERSION) \
		--target $(RUST_TARGET)

ifndef RUST_TARGET
	$(error RUST_TARGET is not set)
endif
