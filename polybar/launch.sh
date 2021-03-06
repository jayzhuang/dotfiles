#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

echo "---" | tee -a /tmp/polybar.log

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload jay >>/tmp/polybar.log 2>&1 &
  done
else
  polybar --reload jay >>/tmp/polybar.log 2>&1 &
fi

echo "Bars launched..."
