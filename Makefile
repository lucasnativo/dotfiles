#Makefile for the Arch Linux
SHELL = /bin/bash
DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
UNAME_S := $(shell uname -s)

SYSTEM_PACKAGES        := git stow tmux ripgrep wget jq zsh fd xclip
NODE_PACKAGES          := n tldr neovim typescript typescript-language-server trash-cli


all: install-system-packages install-node install-neovim setup-node setup-neovim install-fzf install-zplug install-rewritten-in-rust link


link:
	stow --verbose --target=$$HOME --dir=$(DIR) --restow zsh nvim git tmux npm alacritty


install-system-packages:
	sudo pacman -Syu --noconfirm --needed $(SYSTEM_PACKAGES) && \
	mkdir -p $$HOME/.local/bin && ln -s /usr/bin/fd $$HOME/.local/bin/fd

install-zplug:
	if [ ! -d "$$HOME/.zplug" ]; then \
		curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh; \
	fi;

install-fzf:
	if [ ! -d $$HOME/.fzf ]; then git clone --depth 1 https://github.com/junegunn/fzf.git $$HOME/.fzf; fi; \
	$$HOME/.fzf/install --xdg --no-bash --no-fish --key-bindings --no-update-rc --completion

install-node:
	sudo pacman -S --noconfirm --needed nodejs npm

setup-node:
	mkdir -p $$HOME/.npm $$HOME/.n && \
	npm install --prefix $$HOME/.npm -g n && \
	N_PREFIX=$$HOME/.n $$HOME/.npm/bin/n lts && \
	$$HOME/.n/bin/npm install --prefix $$HOME/.npm -g $(NODE_PACKAGES)

install-neovim:
	sudo pacman -S --noconfirm --needed neovim

setup-neovim:
	nvim --headless +"PlugInstall --sync" +"PlugClean\!" +qa

install-rewritten-in-rust:
	sudo pacman -S --noconfirm --needed bat exa ripgrep bandwhich git-delta 
