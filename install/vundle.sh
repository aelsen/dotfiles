#!/usr/bin/env bash

# Install vundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  echo -e "Installing Vundle.";
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi;