##################
# Install Prezto
if [ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]; then
  if [ ! -L "${ZDOTDIR:-$HOME}/.zprezto" ]; then
    ln -nfs "$HOME/.dotfiles/prezto" "${ZDOTDIR:-$HOME}/.zprezto"
  fi
fi

setopt EXTENDED_GLOB
for rcfile in $HOME/.dotfiles/prezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

#####################################################
# Backup/remove original then copy custom dot files

# Gem
if [ -f "$HOME/.gemrc" ]; then
  mv "$HOME/.gemrc" "$HOME/.gemrc.back"
fi
cp ./gemrc "$HOME/.gemrc"

# Zsh
if [ -f "${ZDOTDIR:-$HOME}/.zshrc" ]; then
  if [ -L "${ZDOTDIR:-$HOME}/.zshrc" ]; then
    rm "${ZDOTDIR:-$HOME}/.zshrc"
  else
    mv "${ZDOTDIR:-$HOME}/.zshrc" "${ZDOTDIR:-$HOME}/.zshrc.back"
  fi
fi
ln -s "${ZDOTDIR:-$HOME}/.dotfiles/zshrc" "${ZDOTDIR:-$HOME}/.zshrc"

# Prezto
if [ -f "${ZDOTDIR:-$HOME}/.zpreztorc" ]; then
  if [ -L "${ZDOTDIR:-$HOME}/.zpreztorc" ]; then
    rm "${ZDOTDIR:-$HOME}/.zpreztorc"
  else
    mv "${ZDOTDIR:-$HOME}/.zpreztorc" "${ZDOTDIR:-$HOME}/.zpreztorc.back"
  fi
fi
ln -nfs "$HOME/.dotfiles/zpreztorc" "${ZDOTDIR:-$HOME}/.zpreztorc"
