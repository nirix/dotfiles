##################
# Install Prezto
if [ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]; then
  if [ ! -L "${ZDOTDIR:-$HOME}/.zprezto" ]; then
    ln -nfs "$HOME/.dotfiles/zsh/prezto" "${ZDOTDIR:-$HOME}/.zprezto"
  fi
fi

setopt EXTENDED_GLOB
for rcfile in $HOME/.dotfiles/zsh/prezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "$HOME/.${rcfile:t}"
done

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
ln -s "$HOME/.dotfiles/zsh/zshrc" "$HOME/.zshrc"

# Prezto
if [ -f "$HOME/.zpreztorc" ]; then
  if [ -L "$HOME/.zpreztorc" ]; then
    rm "$HOME/.zpreztorc"
  else
    mv "$HOME/.zpreztorc" "$HOME/.zpreztorc.back"
  fi
fi
ln -nfs "$HOME/.dotfiles/zsh/zpreztorc" "$HOME/.zpreztorc"
