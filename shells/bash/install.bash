# Bash profile
echo "Linking .bash_profile"
ln -s "$HOME/.dotfiles/shells/bash/bash_profile" "$HOME/.bash_profile"

# Theme
echo "Linking theme to bash-it themes directory"
ln -s "$HOME/.dotfiles/shells/bash/themes/wat" "$HOME/.dotfiles/shells/modules/bash_it/themes"

# Plugins
mkdir "$HOME/.dotfiles/shells/modules/bash_it/plugins/enabled"
function enable_plugin {
  echo "Enabling bash-it plugin '$1'"
  ln -s "$HOME/.dotfiles/shells/modules/bash_it/plugins/available/$1.plugin.bash" "$HOME/.dotfiles/shells/modules/bash_it/plugins/enabled/$1.plugin.bash"
}

enable_plugin 'base'
enable_plugin 'battery'
enable_plugin 'browser'
enable_plugin 'dirs'
enable_plugin 'extract'
enable_plugin 'git'
# enable_plugin 'rbenv'

# Aliases
mkdir "$HOME/.dotfiles/shells/modules/bash_it/aliases/enabled"
function enable_alias {
  echo "Enabling bash-it aliases '$1'"
  ln -s "$HOME/.dotfiles/shells/modules/bash_it/aliases/available/$1.plugin.bash" "$HOME/.dotfiles/shells/modules/bash_it/aliases/enabled/$1.plugin.bash"
}

enable_alias 'bundler'
enable_alias 'general'
enable_alias 'git'

# OS X only
if [ "$(uname)" = "Darwin" ]; then
  enable_plugin 'osx'
  enable_alias 'homebrew'
  enable_alias 'osx'
fi
