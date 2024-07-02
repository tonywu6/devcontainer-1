DEFAULT_NODE_VERSION ?= 20
DEFAULT_PNPM_VERSION ?= 9

.PHONY: all
all:

	fnm install $(DEFAULT_NODE_VERSION)
	fnm default $(DEFAULT_NODE_VERSION)

	printf "\n" >>$(HOME)/.zshrc
	printf 'eval "$$(fnm env)"\n' >>$(HOME)/.zshrc

	fnm exec --using=default \
		npm install -g "pnpm@^$(DEFAULT_PNPM_VERSION)"

	SHELL=zsh fnm exec --using=default \
		pnpm setup
