PYTHON_VERSION ?= 3.12
RYE_HOME ?= $(HOME)/.rye

.PHONY: all
all:

	rye toolchain fetch $(PYTHON_VERSION)
	rye self install --yes --toolchain-version $(PYTHON_VERSION)

	printf "\n" >>$(HOME)/.zshrc
	printf 'source "%s/env"\n' $(RYE_HOME) >>$(HOME)/.zshrc
