MICROMAMBA_VERSION ?= 1.5.8

ifeq ($(ARCH), linux/arm64)
	MICROMAMBA_ARCH = linux-aarch64
else ifeq ($(ARCH), linux/amd64)
	MICROMAMBA_ARCH = linux-64
else
	$(error "unsupported ARCH=$(ARCH)")
endif

.PHONY: all
all:

	curl -Ls https://micro.mamba.pm/api/micromamba/$(MICROMAMBA_ARCH)/$(MICROMAMBA_VERSION) | sudo tar -xvj -C /usr/local bin/micromamba

	sudo chmod +x /usr/local/bin/micromamba

	micromamba shell init -s zsh -p ~/micromamba
