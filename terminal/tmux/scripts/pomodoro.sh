#!/bin/bash

TIMER_FILE="/tmp/pomodoro_timer"
DURATION=1500  # 25 minutes en secondes
SOUND_START="$HOME/scripts/Quest Added Sound.ogg"
SOUND_END="$HOME/scripts/Quest Completed Sound.ogg"

play_sound_start() {
    if command -v play >/dev/null 2>&1; then
        if [ -f "$SOUND_START" ]; then
            play "$SOUND_START" >/dev/null 2>&1 &
        else
            echo "Fichier son non trouvé : $SOUND_START"
        fi
    else
        echo "SoX n'est pas installé. Installez-le avec : brew install sox"
    fi
}

play_sound_end() {
    if command -v play >/dev/null 2>&1; then
        if [ -f "$SOUND_END" ]; then
            play "$SOUND_END" >/dev/null 2>&1 &
        else
            echo "Fichier son non trouvé : $SOUND_END"
        fi
    else
        echo "SoX n'est pas installé. Installez-le avec : brew install sox"
    fi
}

case "$1" in
    "start")
        echo $(($(date +%s) + DURATION)) > "$TIMER_FILE"
				play_sound_start
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
            play_sound_end
            rm "$TIMER_FILE"
        else
            minutes=$((remaining / 60))
            seconds=$((remaining % 60))
            printf "🍅 %02d:%02d" $minutes $seconds
        fi
        ;;
esac
