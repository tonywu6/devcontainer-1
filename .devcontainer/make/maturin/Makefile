MATURIN_VERSION ?= 1.6.0

.PHONY: all
all:

	git clone https://github.com/PyO3/maturin \
		--branch v$(MATURIN_VERSION) \
		--depth 1 \
		/tmp/git/maturin

	cargo zigbuild \
		--target $(ZIGBUILD_TARGET) \
		--release \
		--manifest-path /tmp/git/maturin/Cargo.toml \
		--bin maturin

	mv /tmp/git/maturin/target/$(RUSTC_TARGET)/release/maturin $(CARGO_HOME)/bin/maturin

ifndef RUSTC_TARGET
	$(error RUSTC_TARGET is not set)
endif

ifndef ZIGBUILD_TARGET
	$(error ZIGBUILD_TARGET is not set)
endif

ifndef CARGO_HOME
	$(error CARGO_HOME is not set)
endif
