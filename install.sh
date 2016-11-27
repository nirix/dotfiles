#!/bin/bash
#
# .files installation
# Copyright (c) 2012-2016 J. Polgar
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
  linkfile 'vim'

  # git config
  cp config/global/gitconfig ~/.gitconfig
  # linkfile 'gitconfig'

  # modules
  git clone --recursive https://github.com/clvv/fasd.git shells/modules/fasd
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  #git clone --recursive  https://github.com/gmarik/vundle.git vim/bundle/vundle

  echo ".files installed"
}

if [ $SHELL = "zsh" ]; then
  zsh shells/zsh/oh-my-zsh/install.zsh
elif [ $SHELL = "bash" ]; then
  bash shells/bash/install.bash
fi

install
