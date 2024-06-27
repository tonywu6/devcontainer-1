FNM_VERSION ?= 1.37.1

.PHONY: all
all:

	cargo install fnm \
		--git https://github.com/Schniz/fnm \
		--version $(FNM_VERSION) \
		--target $(RUST_TARGET)

ifndef RUST_TARGET
	$(error RUST_TARGET is not set)
endif
