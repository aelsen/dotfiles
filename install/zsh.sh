#!/usr/bin/env bash

# Install ZSH
# Make ZSH the default shell
if ! [ "$SHELL" = "$(which zsh)" ]; then
	echo -e "Configuring ZSH to be the default shell.";
	chsh -s $(which zsh)
else
	MACRO_DEBUG "ZSH already configured as default shell.";
fi;
