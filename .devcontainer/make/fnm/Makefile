FNM_VERSION ?= 1.37.1

.PHONY: all
all:

	git clone https://github.com/Schniz/fnm \
		--branch v$(FNM_VERSION) \
		--depth 1 \
		/tmp/git/fnm

	cargo zigbuild \
		--target $(ZIGBUILD_TARGET) \
		--release \
		--manifest-path /tmp/git/fnm/Cargo.toml \
		--bin fnm

	mv /tmp/git/fnm/target/$(RUSTC_TARGET)/release/fnm $(CARGO_HOME)/bin/fnm

ifndef RUSTC_TARGET
	$(error RUSTC_TARGET is not set)
endif

ifndef ZIGBUILD_TARGET
	$(error ZIGBUILD_TARGET is not set)
endif

ifndef CARGO_HOME
	$(error CARGO_HOME is not set)
endif
