.PHONY: all
all:
	if [ -x "$(command -v apt-get)" ]; then \
		$(MAKE) cleanup-apt; \
	elif [ -x "$(command -v yum)" ]; then \
		$(MAKE) cleanup-yum; \
	fi

	sudo rm -rf /tmp/*

.PHONY: cleanup-apt
cleanup-apt:
	sudo apt-get autoremove -y
	sudo apt-get clean -y

.PHONY: cleanup-yum
cleanup-yum:
	sudo yum clean all
