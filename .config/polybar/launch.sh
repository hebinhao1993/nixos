#!/usr/bin/env sh

# Terminate already running bar instances
# killall -q polybar
# since we do not have killall
# todo: use built in `command`
ps -ef |grep polybar |awk '{print $2}'| xargs kill -9

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch
polybar i3bar &