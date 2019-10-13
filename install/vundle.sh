#!/usr/bin/env sh
VIM_PLUGINS=~/.vim/bundle

# Install vundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  echo -e "Installing Vundle at $VIM_PLUGINS";
  mkdir -p $VIM_PLUGINS && git clone https://github.com/VundleVim/Vundle.vim.git $VIM_PLUGINS/Vundle.vim
fi;