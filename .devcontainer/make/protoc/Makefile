PROTOC_VERSION ?= 25.3

ifeq ($(ARCH), linux/arm64)
	PROTOC_ARCH = linux-aarch_64
else ifeq ($(ARCH), linux/amd64)
	PROTOC_ARCH = linux-x86_64
else
	$(error "unsupported ARCH=$(ARCH)")
endif

.PHONY: all
all:

	sudo curl --location --fail --show-error --progress-bar \
		--output protoc.zip \
		https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOC_VERSION)/protoc-$(PROTOC_VERSION)-$(PROTOC_ARCH).zip

	sudo unzip protoc.zip -d /usr/local bin/protoc

	sudo chmod +x /usr/local/bin/protoc

	sudo rm protoc.zip
