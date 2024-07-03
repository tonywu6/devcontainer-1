DENO_VERSION ?= v1.44.4
DENO_INSTALL ?= $(CARGO_HOME)

.PHONY: all
all:
	curl -fsSL https://deno.land/install.sh | DENO_INSTALL=$(DENO_INSTALL) sh -s -- $(DENO_VERSION)
