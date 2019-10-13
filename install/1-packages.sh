#!/usr/bin/env bash

PACKAGES=(
  "tmux"
  "vim"
  "zsh"
)

for PACKAGE in "${PACKAGES[@]}"
do
  if ! [ -x "$(command -v $PACKAGE)" ]; then
    package_manager_install $PACKAGE
  else
    MACRO_DEBUG "$PACKAGE already installed";
  fi;
done