RYE_VERSION ?= 0.35.0

# https://github.com/astral-sh/rye/blob/0.35.0/rye/src/sources/generated/uv_downloads.inc
UV_VERSION ?= 0.2.13

DEFAULT_PYTHON_VERSION ?= 3.12

RYE_HOME ?= $(HOME)/.rye


.PHONY: build
build:
	$(MAKE) uv
	$(MAKE) rye


.PHONY: install
install:
	$(MAKE) patch-uv

	rye toolchain fetch $(DEFAULT_PYTHON_VERSION)
	rye self install --yes --toolchain-version $(DEFAULT_PYTHON_VERSION)

	printf "\n" >>$(HOME)/.zshrc
	printf 'source "%s/env"\n' $(RYE_HOME) >>$(HOME)/.zshrc
	printf 'export VIRTUAL_ENV_DISABLE_PROMPT=1\n' >>$(HOME)/.zshrc


.PHONY: rye
rye:
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


.PHONY: uv
uv:
	git clone https://github.com/astral-sh/uv \
		--branch $(UV_VERSION) \
		--depth 1 \
		/tmp/git/uv

	cargo zigbuild \
		--target $(ZIGBUILD_TARGET) \
		--release \
		--manifest-path /tmp/git/uv/Cargo.toml \
		--bin uv

	mv /tmp/git/uv/target/$(RUSTC_TARGET)/release/uv $(CARGO_HOME)/bin/uv


.PHONY: patch-uv
patch-uv:
	if $(CARGO_HOME)/bin/uv --version | grep -q $(UV_VERSION); then \
		mkdir -p $(RYE_HOME)/uv/$(UV_VERSION); \
		ln -s $(CARGO_HOME)/bin/uv $(RYE_HOME)/uv/$(UV_VERSION)/uv; \
	fi


ifndef RUSTC_TARGET
	$(error RUSTC_TARGET is not set)
endif

ifndef ZIGBUILD_TARGET
	$(error ZIGBUILD_TARGET is not set)
endif

ifndef CARGO_HOME
	$(error CARGO_HOME is not set)
endif
