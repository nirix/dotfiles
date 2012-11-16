# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.prezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.prezto/init.zsh"
fi

# Customize to your needs...

# Alias to fix the crappy subl tool for Sublime
alias subt="subl; subl -a"

# Spotify control from the CLI
alias spotify="osascript ~/.dotfiles/modules/spotify_control/SpotifyControl.scpt"

# Load z
source ~/.dotfiles/modules/z/z.sh

# Lazy
alias py=python

# No crap gem installation
# This is set in the .gemrc file, but eh
alias geminst="gem install --no-rdoc --no-ri"

# http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 10'"
alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF R U DOIN'"