DENO_VERSION ?= 1.44.4

.PHONY: all
all:

	git clone https://github.com/denoland/deno \
		--branch v$(DENO_VERSION) \
		--depth 1 \
		/tmp/git/deno

	cargo zigbuild \
		--target $(ZIGBUILD_TARGET) \
		--release \
		--manifest-path /tmp/git/deno/cli/Cargo.toml \
		--bin deno

	mv /tmp/git/deno/target/$(RUSTC_TARGET)/release/deno $(CARGO_HOME)/bin/deno

ifndef RUSTC_TARGET
	$(error RUSTC_TARGET is not set)
endif

ifndef ZIGBUILD_TARGET
	$(error ZIGBUILD_TARGET is not set)
endif

ifndef CARGO_HOME
	$(error CARGO_HOME is not set)
endif
