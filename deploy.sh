#!/usr/bin/env bash
#
# Dotfiles deployment script.
# Supports Darwin, Ubuntu OSes.
#
#

DEBUG=true
OS="UNDEF";
PKG_INSTALL="UNDEF";
PKG_UPDATE="UNDEF";

# Macro debug print
function MACRO_DEBUG() {
	if [ "$DEBUG" = true ]; then
		echo -e $1;
	fi;
}

# Deploy dotfiles
function deploy() {
	git submodule update --init

	os_setup;
	for f in install/*; do  # or wget-*.sh instead of *.sh
		echo -e "Running \"$f\".";
		source "$f";
	done

	sync_files
}

# Install Brew
function install_brew() {
  if ! [ -x "$(command -v brew)" ]; then
    echo -e "Installing brew.";
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    MACRO_DEBUG "Brew already installed.";
  fi;
}

# Determine OS, determine package management tool
function os_setup () {
	OS=$(uname);

	case "$OS" in
		"Linux")
			PKG_INSTALL="sudo apt-get install";
			PKG_UPDATE="sudo apt-get install --only-upgrade";
			;;
		"Darwin")
			PKG_INSTALL="brew install";
			PKG_UPDATE="brew upgrade";
			install_brew;
			;;
		*)
			echo "...";
			;;
	esac

	MACRO_DEBUG "Package manager: \"$PKG_INSTALL\".";
}

# Install via OS package manager
function package_manager_install() {
	echo -e "Installing $1.";
	echo -e "	\"$PKG_INSTALL $1\"";  # DEBUG
	$PKG_INSTALL $1
}

# Update via OS package manager
function package_manager_update() {
	echo -e "Updating $1.";
	echo -e "	\"$PKG_UPDATE $1\"";  # DEBUG
	$PKG_UPDATE $1;
}

function sync_files() {
	rsync \
		--exclude ".git/" \
		--exclude "install/" \
		--exclude "shell/" \
		--exclude "tmux/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "deploy.sh" \
		--exclude "README*" \
		--exclude "LICENSE*" \
		-avh --no-R --no-perms . ~;
	
	rsync -cv --no-R shell/.* ~
	rsync -cv --no-R shell/bash/.* ~
	rsync -cv --no-R shell/zsh/.* ~
	rsync -cv --no-R tmux/.*.conf* ~
	
	source ~/.bash_profile;
}

deploy



unset PKG_UPDATE
unset PKG_INSTALL
unset OS
unset DEBUG