##################
# Install oh-my-zsh
git clone --recursive https://github.com/robbyrussell/oh-my-zsh.git ~/.dotfiles/shells/modules/oh-my-zsh

# Rename exisiting files
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc.pre-oh-my-zsh;
fi

ln -s "$HOME/.dotfiles/shells/zsh/oh-my-zsh/zshrc" "$HOME/.zshrc"
ln -s "$HOME/.dotfiles/shells/zsh/oh-my-zsh/themes/wat.zsh-theme" "$HOME/.dotfiles/shells/modules/oh-my-zsh/themes/wat.zsh-theme"