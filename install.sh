#!/bin/bash
#
# .files installation
# Copyright (c) 2012-2013 J. Polgar
#

read -p "What shell are you using? [zsh/fish/bash] " SHELL

echo "Setting up for $SHELL"

function install {
  # Gem file
  if [ -f "$HOME/.gemrc" ]; then
    mv "$HOME/.gemrc" "$HOME/.gemrc.old"
  fi

  if [ -f "$HOME/.vimrc" ]; then
    mv "$HOME/.vimrc" "$HOME/.vimrc.old"
  fi

  ln -s "$HOME/.dotfiles/gemrc" "$HOME/.gemrc"
  ln -s "$HOME/.dotfiles/vim/vimrc" "$HOME/.vimrc"

  echo ".files installed"
}

if [ $SHELL = "zsh" ]; then
  zsh zsh/install.zsh
elif [ $SHELL = "bash" ]; then
  bash bash/install.bash
fi

install
