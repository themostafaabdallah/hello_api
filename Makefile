GO_VERSION := 1.25.0
OS := $(shell uname -s)

.PHONY: install-go init-go setup

setup: install-go init-go

build:
	go build -o api cmd/main.go

install-go:
ifeq ($(OS),Linux)
	wget "https://go.dev/dl/go$(GO_VERSION).linux-amd64.tar.gz"
	sudo tar -C /usr/local -xzf go$(GO_VERSION).linux-amd64.tar.gz
	rm go$(GO_VERSION).linux-amd64.tar.gz
endif
ifeq ($(OS),Darwin)
	curl -LO "https://go.dev/dl/go$(GO_VERSION).darwin-amd64.pkg"
	sudo installer -pkg go$(GO_VERSION).darwin-amd64.pkg -target /
	rm go$(GO_VERSION).darwin-amd64.pkg
endif

init-go:
	@echo "Adding Go paths to shell configuration..."
	@if [ -f $${HOME}/.bashrc ]; then \
		echo 'export PATH=$$PATH:/usr/local/go/bin' >> $${HOME}/.bashrc; \
		echo 'export PATH=$$PATH:$${HOME}/go/bin' >> $${HOME}/.bashrc; \
	fi
	@if [ -f $${HOME}/.zshrc ]; then \
		echo 'export PATH=$$PATH:/usr/local/go/bin' >> $${HOME}/.zshrc; \
		echo 'export PATH=$$PATH:$${HOME}/go/bin' >> $${HOME}/.zshrc; \
	fi
	@echo "Go setup complete. Please restart your terminal or source your shell config."
