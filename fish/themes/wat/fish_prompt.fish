function _git_branch_name
  echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  set -l cyan (set_color cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l magenta (set_color -o magenta)
  set -l normal (set_color normal)

  set -l arrow "$normal> "
  # set -l cwd $cyan(basename (prompt_pwd))
  set -l cwd $cyan(echo $PWD | sed -e 's,'"$HOME"',~,g')

  set -l user $red(whoami) ' '

  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)
    set git_info "$green ["$blue"git"$green":$git_branch]"

    # Dirty
    # if [ (_is_git_dirty) ]
    #   set -l dirty "$red ✗"
    #   set git_info "$git_info$dirty"
    # end

    # Added
    if [ (git status -s | grep -E '^[A]| [A] ' ^/dev/null ) ]
      set git_info "$git_info $green✚"
    end

    # Deleted
    if [ (git status -s | grep -E '^[D]| [D] ' ^/dev/null ) ]
      set git_info "$git_info $red✖"
    end

    # Modified
    if [ (git status -s | grep -e '^[M]| [M] ' ^/dev/null ) ]
      set git_info "$git_info $blue✱"
    end

    # Renamed / renamed and deleted
    if [ (git status -s | grep -E '^[R]|[R][D] ' ^/dev/null ) ]
      set git_info "$git_info $magenta➜"
    end

    # Unstaged
    # if [ (git status -s | grep -E '^\?\? ' ^/dev/null ) ]
    #   set git_info "$git_info $normal◼"
    # end
  end

  echo -n -s $user "$normal"$cwd $git_info $normal '
' $arrow
end

