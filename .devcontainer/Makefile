%:
	$(MAKE) -C make/$@

TARGETPLATFORM ?= none

RUSTC_TARGET =
ZIGBUILD_TARGET =

CARGO_HOME ?= $(HOME)/.cargo

ifeq ($(TARGETPLATFORM), linux/arm64)
	RUSTC_TARGET = aarch64-unknown-linux-gnu
else ifeq ($(TARGETPLATFORM), linux/amd64)
	RUSTC_TARGET = x86_64-unknown-linux-gnu
else
	$(error "unsupported platform $(TARGETPLATFORM)")
endif

ifdef ZIGBUILD_GLIBC
	ZIGBUILD_TARGET = $(RUSTC_TARGET).$(ZIGBUILD_GLIBC)
else
	ZIGBUILD_TARGET = $(RUSTC_TARGET)
endif

export
