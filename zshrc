# oh-my-zsh config
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git cloudapp gem osx textmate sublime brew)

# load oh my zsh
source $ZSH/oh-my-zsh.sh

# Alias to fix the crappy subl tool for Sublime
alias subt="subl; subl -a"

# Spotify control from the CLI
alias spotify="osascript ~/.code/SpotifyControl/SpotifyControl.scpt"

# Lazy
alias py=python

# No crap gem installation
# This is set in the .gemrc file, but eh
alias geminst="gem install --no-rdoc --no-ri"

# Load z
source ~/.code/z/z.sh

# http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 10'"
alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF R U DOIN'"
