#!/bin/bash
#
# .files installation
# Copyright (c) 2012-2015 J. Polgar
#

read -p "What shell are you using? [zsh/bash] " SHELL

echo "Setting up for $SHELL"

function linkfile {
  if [ -f "$HOME/$1" ] || [ -d "$HOME/$1" ]; then
    echo "Moved ~/.$1 to ~/.$1.back"
    mv "$HOME/$1" "$HOME/$1.back"
  fi

  ln -s "$HOME/.dotfiles/config/global/$1" "$HOME/.$1"
}

function install {
  # Link dot files
  linkfile 'gemrc'
  linkfile 'vimrc'
  linkfile 'gvimrc'

  # Link dot directories
  #linkfile 'vim'

  # git config
  #cp gitconfig ~/.gitconfig
  linkfile 'gitconfig'

  # modules
  git clone --recursive https://github.com/clvv/fasd.git shells/modules/fasd
  #git clone --recursive  https://github.com/gmarik/vundle.git vim/bundle/vundle

  echo ".files installed"
}

if [ $SHELL = "zsh" ]; then
  zsh shells/zsh/install.zsh
elif [ $SHELL = "bash" ]; then
  bash shells/bash/install.bash
fi

install
