RYE_VERSION ?= 0.35.0

.PHONY: all
all:

	git clone https://github.com/astral-sh/rye \
		--branch $(RYE_VERSION) \
		--depth 1 \
		/tmp/git/rye

	cargo zigbuild \
		--target $(ZIGBUILD_TARGET) \
		--release \
		--manifest-path /tmp/git/rye/Cargo.toml \
		--bin rye

	mv /tmp/git/rye/target/$(RUSTC_TARGET)/release/rye $(CARGO_HOME)/bin/rye

ifndef RUSTC_TARGET
	$(error RUSTC_TARGET is not set)
endif

ifndef ZIGBUILD_TARGET
	$(error ZIGBUILD_TARGET is not set)
endif

ifndef CARGO_HOME
	$(error CARGO_HOME is not set)
endif
