# Aliases
source "$HOME/.dotfiles/shells/aliases/general"

# Path
# Add the .local/bin and .dotfiles/bin directories
export PATH=$HOME/.dotfiles/bin:$HOME/.local/bin:$PATH

# Editor
export EDITOR=vim

# Load fasd
alias fasd="$HOME/.dotfiles/shells/modules/fasd/fasd"
eval "$(fasd --init auto)"

# Linux, OS X or FreeBSD?
if [ "$(uname)" = "Linux" ]; then

  # chruby
  if [[ -s "/usr/share/chruby/chruby.sh" ]]; then
    source /usr/share/chruby/chruby.sh
    source /usr/share/chruby/auto.sh
  fi

  # source "$HOME/.dotfiles/aliases/linux"

elif [ "$(uname)" = "Darwin" ]; then

  # SSL Certificate file
  # export SSL_CERT_FILE="`brew --prefix curl-ca-bundle`/share/ca-bundle.crt"

  # chruby
  if [[ -s "/usr/local/opt/chruby/share/chruby/chruby.sh" ]]; then
    source /usr/local/opt/chruby/share/chruby/chruby.sh
    source /usr/local/opt/chruby/share/chruby/auto.sh
  fi

  source "$HOME/.dotfiles/shells/aliases/osx"

elif [ "$(uname)" = "FreeBSD" ]; then

fi

# Local system only stuff
if [[ -s "$HOME/.dotfiles/local.sh" ]]; then
  source "$HOME/.dotfiles/local.sh"
fi
