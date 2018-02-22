##################
# Install Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.dotfiles/shells/modules/prezto

if [ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]; then
  if [ ! -L "${ZDOTDIR:-$HOME}/.zprezto" ]; then
    ln -nfs "$HOME/.dotfiles/shells/modules/prezto" "${ZDOTDIR:-$HOME}/.zprezto"
  fi
fi

# setopt EXTENDED_GLOB
# for rcfile in $HOME/.dotfiles/shells/modules/prezto/runcoms/^README.md(.N); do
#   ln -s "$rcfile" "$HOME/.${rcfile:t}"
# done

#####################################################
# Backup/remove original then copy custom dot files

# Zsh
if [ -f "$HOME/.zshrc" ]; then
  if [ -L "$HOME/.zshrc" ]; then
    rm "$HOME/.zshrc"
  else
    mv "$HOME/.zshrc" "$HOME/.zshrc.back"
  fi
fi
ln -s "$HOME/.dotfiles/shells/zsh/prezto/zshrc" "$HOME/.zshrc"

# Prezto
if [ -f "$HOME/.zpreztorc" ]; then
  if [ -L "$HOME/.zpreztorc" ]; then
    rm "$HOME/.zpreztorc"
  else
    mv "$HOME/.zpreztorc" "$HOME/.zpreztorc.back"
  fi
fi
ln -nfs "$HOME/.dotfiles/shells/zsh/prezto/zpreztorc" "$HOME/.zpreztorc"
