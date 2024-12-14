#!/bin/bash

TIMER_FILE="/tmp/pomodoro_timer"
DURATION=1500  # 25 minutes en secondes

case "$1" in
    "start")
        echo $(($(date +%s) + DURATION)) > "$TIMER_FILE"
        ;;
    "stop")
        rm -f "$TIMER_FILE"
        ;;
    *)
        if [ ! -f "$TIMER_FILE" ]; then
            echo "🍅 --:--"
            exit 0
        fi

        current_time=$(date +%s)
        end_time=$(cat "$TIMER_FILE")
        remaining=$((end_time - current_time))

        if [ $remaining -le 0 ]; then
            echo "🍅 Done"
            rm "$TIMER_FILE"
        else
            minutes=$((remaining / 60))
            seconds=$((remaining % 60))
            printf "🍅 %02d:%02d" $minutes $seconds
        fi
        ;;
esac
