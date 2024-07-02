BUF_VERSION ?= 1.34.0

ifeq ($(TARGETPLATFORM), linux/arm64)
	BUF_ARCH = Linux-aarch64
else ifeq ($(TARGETPLATFORM), linux/amd64)
	BUF_ARCH = Linux-x86_64
else
	$(error "unsupported platform $(TARGETPLATFORM)")
endif

.PHONY: all
all:

	curl -sSL \
		"https://github.com/bufbuild/buf/releases/download/v$(BUF_VERSION)/buf-$(BUF_ARCH).tar.gz" | \
		sudo tar -xvzf - -C /usr/local --strip-components 1
