#!/bin/bash

# Obter eventos
event=$(khal list --format "{start-time}|{title}\n{location}" today today | grep -oP '(?<='$(date +%H:%M)'\|).+$' --color=never)

if [ "$event" = "" ]; then
  echo No events at $(date +%H:%M)
  exit 0
fi

# Notify Event
notify-send "Reunião Agora" "$event" -i /usr/share/icons/Papirus-Dark/16x16/apps/calendar.svg

