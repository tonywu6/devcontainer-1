ZIG_VERSION ?= 0.13.0

ifeq ($(TARGETPLATFORM), linux/arm64)
	ZIG_ARCH = aarch64
else ifeq ($(TARGETPLATFORM), linux/amd64)
	ZIG_ARCH = x86_64
else
	$(error "unsupported platform $(TARGETPLATFORM)")
endif

.PHONY: all
all:
	curl --location --fail --show-error --progress-bar \
		https://ziglang.org/download/$(ZIG_VERSION)/zig-linux-$(ZIG_ARCH)-$(ZIG_VERSION).tar.xz \
		| sudo tar -xJf - -C /usr/local/bin --strip-components=1
