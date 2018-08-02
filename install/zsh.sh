#!/usr/bin/env bash

# Install ZSH
if ! [ -x "$(command -v zsh)" ]; then
	package_manager_install zsh
else
	MACRO_DEBUG "ZSH already installed.";
fi;

# Make ZSH the default shell
if ! [ "$SHELL" = "$(which zsh)" ]; then
	echo -e "Configuring ZSH to be the default shell.";
	chsh -s $(which zsh)
else
	MACRO_DEBUG "ZSH already configured as default shell.";
fi;

# Install Oh-My-ZSH
if [ ! -d ~/.oh-my-zsh ]; then
	echo -e "Installing Oh-My-ZSH.";
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
	MACRO_DEBUG "Oh-My-ZSH already installed.";
fi;