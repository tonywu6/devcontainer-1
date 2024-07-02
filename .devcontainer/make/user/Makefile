ZSH = $(shell which zsh)

.PHONY: all
all:
	if id -u vscode &>/dev/null; then \
		chsh -s $(ZSH) vscode; \
	else \
		$(MAKE) adduser; \
	fi

.PHONY: adduser
adduser:
	groupadd -g 1000 vscode
	useradd vscode -m -d /home/vscode -s $(ZSH) -u 1000 -g 1000

	if getent group docker &>/dev/null; then \
		usermod -aG docker vscode; \
	fi

	if getent group sudo &>/dev/null; then \
		usermod -aG sudo vscode; \
	fi

	if getent group wheel &>/dev/null; then \
		usermod -aG wheel vscode; \
	fi

	echo "vscode ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/vscode
