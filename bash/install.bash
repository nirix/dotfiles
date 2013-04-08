# Bash profile
echo "Linking .bash_profile"
ln -s "$HOME/.dotfiles/bash/bash_profile" "$HOME/.bash_profile"

# Theme
echo "Linking theme to bash-it themes directory"
ln -s "$HOME/.dotfiles/bash/themes/wat" "$HOME/.dotfiles/bash/bash_it/themes/wat"

# Plugins
mkdir "$HOME/.dotfiles/bash/bash_it/plugins/enabled"
function enable_plugin {
  echo "Enabling bash-it plugin '$1'"
  ln -s "$HOME/.dotfiles/bash/bash_it/plugins/available/$1.plugin.bash" "$HOME/.dotfiles/bash/bash_it/plugins/enabled/$1.plugin.bash"
}

enable_plugin 'base'
enable_plugin 'battery'
enable_plugin 'browser'
enable_plugin 'dirs'
enable_plugin 'extract'
enable_plugin 'fasd'
enable_plugin 'git'
enable_plugin 'osx'
enable_plugin 'rbenv'

# Aliases
mkdir "$HOME/.dotfiles/bash/bash_it/aliases/enabled"
function enable_alias {
  echo "Enabling bash-it aliases '$1'"
  ln -s "$HOME/.dotfiles/bash/bash_it/aliases/available/$1.plugin.bash" "$HOME/.dotfiles/bash/bash_it/aliases/enabled/$1.plugin.bash"
}

enable_alias 'bundler'
enable_alias 'general'
enable_alias 'git'
enable_alias 'homebrew'
enable_alias 'osx'
