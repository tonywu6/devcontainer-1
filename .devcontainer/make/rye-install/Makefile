DEFAULT_PYTHON_VERSION ?= 3.12
RYE_HOME ?= $(HOME)/.rye

.PHONY: all
all:

	$(MAKE) uv-patch-check

	rye toolchain fetch $(DEFAULT_PYTHON_VERSION)
	rye self install --yes --toolchain-version $(DEFAULT_PYTHON_VERSION)

	printf "\n" >>$(HOME)/.zshrc
	printf 'source "%s/env"\n' $(RYE_HOME) >>$(HOME)/.zshrc


UV_ARCH =

ifeq ($(TARGETPLATFORM), linux/arm64)
	UV_ARCH = aarch64-unknown-linux-musl
else ifeq ($(TARGETPLATFORM), linux/amd64)
	UV_ARCH = x86_64-unknown-linux-musl
else
	$(error "unsupported platform $(TARGETPLATFORM)")
endif

.PHONY: uv-patch-check
uv-patch-check:

	if ldd --version | grep -Eq "\b(2.17|2.24)\b"; then \
		$(MAKE) uv-patch; \
	fi

.PHONY: uv-patch
uv-patch:

	mkdir -p $(RYE_HOME)/uv/0.2.13

	curl --location --fail --show-error --progress-bar \
		https://github.com/astral-sh/uv/releases/download/0.2.13/uv-$(UV_ARCH).tar.gz \
		| tar -xzf - -C $(RYE_HOME)/uv/0.2.13 --strip-components=1
