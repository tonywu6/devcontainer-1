%:
	$(MAKE) -C make/$@

CC_x86_64_unknown_linux_gnu := x86_64-linux-gnu-gcc
CC_aarch64_unknown_linux_gnu := aarch64-linux-gnu-gcc
CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER := $(CC_x86_64_unknown_linux_gnu)
CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER := $(CC_aarch64_unknown_linux_gnu)

ARCH ?= none

RUST_TARGET =

ifeq ($(ARCH), linux/arm64)
	RUST_TARGET = aarch64-unknown-linux-gnu
else ifeq ($(ARCH), linux/amd64)
	RUST_TARGET = x86_64-unknown-linux-gnu
else
	$(error "unsupported ARCH=$(ARCH)")
endif

export
