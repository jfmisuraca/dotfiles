#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar
if type "xrandr"; then
  #for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  MONITOR=HDMI-0 polybar --reload example &
  MONITOR=VGA-0 polybar --reload example2 &
  #done
else
  polybar --reload example &
fi

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
#polybar example 2>&1 | tee -a /tmp/polybar1.log &
disown

echo "Bars launched..."
