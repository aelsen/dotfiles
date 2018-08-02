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

deploy

function sync_files() {
	rsync \
		--exclude ".git/" \
		--exclude "shell/" \
		--exclude "tmux/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README*" \
		--exclude "LICENSE*" \
		-avhn --no-perms . ~;
	
	rsync -n shell/.* ~
	rsync -n shell/bash/.* ~
	rsync -n shell/zsh/.* ~
	rsync -n tmux/.*.conf* ~
	
	source ~/.bash_profile;
}

# if [ "$1" == "--force" -o "$1" == "-f" ]; then
# 	sync_files;
# else
# 	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
# 	echo "";
# 	if [[ $REPLY =~ ^[Yy]$ ]]; then
# 		sync_files;
# 	fi;
# fi;
# unset sync_files;

unset PKG_UPDATE
unset PKG_INSTALL
unset OS
unset DEBUG