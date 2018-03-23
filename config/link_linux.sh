function linkfile_linux {
  if [ -f "$HOME/$1" ] || [ -d "$HOME/$1" ]; then
    echo "Moved ~/.$1 to ~/.$1.back"
    mv "$HOME/$1" "$HOME/$1.back"
  fi

  ln -s "$HOME/.dotfiles/config/linux/config/$1" "$HOME/.config/$1"
}

linkfile_linux "compton.conf"
linkfile_linux "i3"
linkfile_linux "bspwm"
linkfile_linux "sxhkd"
linkfile_linux "polybar"
linkfile_linux "dunst"

ln -s $HOME/.dotfiles/config/linux/Xresources $HOME/.Xresources
