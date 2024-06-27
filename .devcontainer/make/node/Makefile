NODE_VERSION ?= 20
PNPM_VERSION ?= 9

.PHONY: all
all:

	fnm install $(NODE_VERSION)
	fnm default $(NODE_VERSION)

	printf "\n" >>$(HOME)/.zshrc
	printf 'eval "$$(fnm env)"\n' >>$(HOME)/.zshrc

	fnm exec --using=default \
		npm install -g "pnpm@^$(PNPM_VERSION)"

	SHELL=zsh fnm exec --using=default \
		pnpm setup
