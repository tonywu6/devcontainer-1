SCCACHE_VERSION ?= 0.8.1

ifeq ($(TARGETPLATFORM), linux/arm64)
	SCCACHE_ARCH = aarch64-unknown-linux-musl
else ifeq ($(TARGETPLATFORM), linux/amd64)
	SCCACHE_ARCH = x86_64-unknown-linux-musl
else
	$(error "unsupported platform $(TARGETPLATFORM)")
endif

.PHONY: all
all:
	curl --location --fail --show-error --progress-bar \
		https://github.com/mozilla/sccache/releases/download/v$(SCCACHE_VERSION)/sccache-v$(SCCACHE_VERSION)-$(SCCACHE_ARCH).tar.gz \
		| tar -xzf - -C /usr/local/bin --strip-components=1
