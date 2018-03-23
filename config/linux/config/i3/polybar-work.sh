#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  moncount=$(xrandr --query | grep " connected" | cut -d" " -f1 | wc -l)
  if [ "$moncount" == 1 ]; then
    MONITOR=eDP-1 polybar primary &
  else
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
      if [ $m = "HDMI-1" ] || [ $m = "DP-1-2" ] || [ $m = "DP-2-2" ]; then
        MONITOR=$m polybar primary &
      else
        MONITOR=$m polybar secondary &
      fi
    done
  fi
else
  MONITOR=eDP-1 polybar primary &
fi

echo "Bars launched..."
