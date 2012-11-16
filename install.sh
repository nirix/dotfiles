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

###################################
# Backup and copy custom dot files

# Gem
if [ -f "$HOME/.gemrc" ]; then
  mv "$HOME/.gemrc" "$HOME/.gemrc.back"
fi
cp ./gemrc "$HOME/.gemrc"

# Zsh
#if [ -f "$HOME/.zshrc" ]; then
#  mv "${ZDOTDIR:-$HOME}/.zshrc" "${ZDOTDIR:-$HOME}/.zshrc.back"
#fi
#cp ./zshrc "${ZDOTDIR:-$HOME}/.zshrc"

# Prezto
if [ -f $HOME/.zpreztorc ]; then
  mv "$HOME/.zpreztorc" "$HOME/.zpreztorc.back"
fi
ln -nfs "$HOME/.dotfiles/zpreztorc" "${ZDOTDIR:-$HOME}/.zpreztorc"
