xresource() {
  xrdb -query | grep -E "^(bspwm|\*)(\.)?$1" | sed -r "s/^[^:]+:\s+//" | tail -n 1
}

bspc monitor -d I II III IV V VI VII VIII IX X

bpsc config normal_border_color $(xresource color8)
bpsc config active_border_color $(xresource color6)
bpsc config focused_border_color $(xresource color4)

# Focus follows mouse
bspc config focus_follows_pointer true

bspc config border_width         2
bspc config window_gap          12

bspc config split_ratio          0.52
bspc config borderless_monocle   true
bspc config gapless_monocle      true

#bspc rule -a Gimp desktop='^8' state=floating follow=on
#bspc rule -a Chromium desktop='^2'
#bspc rule -a mplayer2 state=floating
#bspc rule -a Kupfer.py focus=on
#bspc rule -a Screenkey manage=off
