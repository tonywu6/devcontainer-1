GO_VERSION ?= 1.22.4

ifeq ($(ARCH), linux/arm64)
	GOOS = linux
	GOARCH = arm64
else ifeq ($(ARCH), linux/amd64)
	GOOS = linux
	GOARCH = amd64
else
	$(error "unsupported ARCH=$(ARCH)")
endif

.PHONY: all
all:

	sudo rm -rf /usr/local/go

	curl --location --fail --show-error --progress-bar \
		https://go.dev/dl/go$(GO_VERSION).$(GOOS)-$(GOARCH).tar.gz \
		| sudo tar -C /usr/local -xzf -

	curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer \
		|  PATH="/usr/local/go/bin:$$PATH" bash

	printf '\n' >> $(HOME)/.zshrc
	printf 'export PATH="/usr/local/go/bin:$$PATH"\n' >> $(HOME)/.zshrc
	printf 'export PATH="$$(go env GOPATH):$$PATH"\n' >> $(HOME)/.zshrc
