DENO_VERSION ?= v1.44.4

.PHONY: all
all:
	export DENO_INSTALL=$$CARGO_HOME

	curl -fsSL https://deno.land/install.sh | sh -s -- $(DENO_VERSION)
