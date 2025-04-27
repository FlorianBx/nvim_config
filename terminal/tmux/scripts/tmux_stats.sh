#!/bin/bash

CACHE_FILE="/tmp/tmux_stats_cache"
CACHE_DURATION=5  # Rafraîchissement toutes les 5 secondes

current_time=$(date +%s)

if [ ! -f "$CACHE_FILE" ] || [ $((current_time - $(stat -f "%m" "$CACHE_FILE"))) -gt $CACHE_DURATION ]; then
    mem_free=$(vm_stat | awk -F" " "/free/ {print int(\$3/256) \"M Free\"}")
    cpu_usage=$(top -l 1 | grep "CPU usage" | awk "{print \$3 + \$5 \"% CPU\"}")
    echo "$mem_free|$cpu_usage" > "$CACHE_FILE"
fi

IFS='|' read -r mem cpu shell < "$CACHE_FILE"
echo "$mem | $cpu"
