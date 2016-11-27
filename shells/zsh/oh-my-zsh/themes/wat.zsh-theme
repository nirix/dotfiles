PROMPT='%{$fg[red]%}%n%f%b %{$fg[cyan]%}%~%{$reset_color%} $(git_super_status)
%{$reset_color%}%f> '
RPROMPT=''

# git_prompt_info
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}[%{$fg[blue]%}git:%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[green]%}] %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}]"

# git_super_status
git_super_status() {
    precmd_update_git_vars
    if [ -n "$__CURRENT_GIT_STATUS" ]; then
      STATUS="$ZSH_THEME_GIT_PROMPT_PREFIX$ZSH_THEME_GIT_PROMPT_BRANCH_PREFIX$GIT_BRANCH$ZSH_THEME_GIT_PROMPT_BRANCH_SUFFIX%{${reset_color}%}"
      if [ "$GIT_BEHIND" -ne "0" ]; then
          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_BEHIND$GIT_BEHIND%{${reset_color}%}"
      fi
      if [ "$GIT_AHEAD" -ne "0" ]; then
          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD$GIT_AHEAD%{${reset_color}%}"
      fi
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SEPARATOR"
      if [ "$GIT_STAGED" -ne "0" ]; then
          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED$GIT_STAGED%{${reset_color}%}"
      fi
      if [ "$GIT_CONFLICTS" -ne "0" ]; then
          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CONFLICTS$GIT_CONFLICTS%{${reset_color}%}"
      fi
      if [ "$GIT_CHANGED" -ne "0" ]; then
          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CHANGED$GIT_CHANGED%{${reset_color}%}"
      fi
      if [ "$GIT_UNTRACKED" -ne "0" ]; then
          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED%{${reset_color}%}"
      fi
      if [ "$GIT_CHANGED" -eq "0" ] && [ "$GIT_CONFLICTS" -eq "0" ] && [ "$GIT_STAGED" -eq "0" ] && [ "$GIT_UNTRACKED" -eq "0" ]; then
          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
      fi
      STATUS="$STATUS%{${reset_color}%}$ZSH_THEME_GIT_PROMPT_SUFFIX"
      echo "$STATUS"
    fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}[%{$fg_bold[blue]%}git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
ZSH_THEME_GIT_PROMPT_BRANCH_PREFIX="%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_BRANCH_SUFFIX="%{$fg_bold[green]%}]"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{✱%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
