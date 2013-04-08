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
    read -p "Overwrite .gemrc? [y/n] " REPLACE_GEMRC
    if [ $REPLACE_GEMRC = 'y' ]; then
      rm "$HOME/.gemrc"
      ln -s "$HOME/.dotfiles/gemrc" "$HOME/.gemrc"
    fi
  fi

  echo ".files installed"
}

if [ $SHELL = "zsh" ]; then
  zsh zsh/install.zsh
  install
elif [ $SHELL = "fish" ]; then
  fish fish/install.fish
  install
elif [ $SHELL = "bash" ]; then
  bash bash/install.bash
  install
fi

