# Linux or OS X?
if [ "$(uname)" != "Darwin" ]; then

  # chruby
  if [[ -s "/usr/share/chruby/chruby.sh" ]]; then
    source /usr/share/chruby/chruby.sh
    source /usr/share/chruby/auto.sh
  fi

  # source "$HOME/.dotfiles/aliases/linux"

else

  # SSL Certificate file
  export SSL_CERT_FILE="`brew --prefix curl-ca-bundle`/share/ca-bundle.crt"

  # chruby
  if [[ -s "/usr/local/share/chruby/chruby.sh" ]]; then
    source /usr/local/share/chruby/chruby.sh
    source /usr/local/share/chruby/auto.sh
  fi

  source "$HOME/.dotfiles/aliases/osx"

fi

# Load fasd
alias fasd="$HOME/.dotfiles/modules/fasd/fasd"
eval "$(fasd --init auto)"
