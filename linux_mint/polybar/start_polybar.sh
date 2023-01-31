#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

for i in /sys/class/hwmon/hwmon*/temp*_input; do 
    if [ "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*}))" = "coretemp: Package id 0" ]; then
        export HWMON_PATH="$i"
    fi
done

# Launch bar
echo "---" | tee -a /tmp/polybar-i3.log
polybar polybar-i3 >>/tmp/polybar-i3.log 2>&1 &

echo "Polybar launched..."
