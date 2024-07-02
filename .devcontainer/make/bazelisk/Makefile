BAZELISK_VERSION ?= 1.20.0

BAZELISK_BIN ?= /usr/local/bin

ifeq ($(TARGETPLATFORM), linux/arm64)
	BAZELIST_ARCH = linux-arm64
else ifeq ($(TARGETPLATFORM), linux/amd64)
	BAZELIST_ARCH = linux-amd64
else
	$(error "unsupported platform $(TARGETPLATFORM)")
endif

.PHONY: all
all:

	sudo curl --location --fail --show-error --progress-bar \
		--output $(BAZELISK_BIN)/bazelisk \
		https://github.com/bazelbuild/bazelisk/releases/download/v$(BAZELISK_VERSION)/bazelisk-$(BAZELIST_ARCH)

	sudo chmod +x $(BAZELISK_BIN)/bazelisk

	sudo ln -s $(BAZELISK_BIN)/bazelisk $(BAZELISK_BIN)/bazel
