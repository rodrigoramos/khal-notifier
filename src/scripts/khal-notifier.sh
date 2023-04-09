#!/bin/bash

# Obter eventos
event=$(khal list --format "{start-time}::{title}::{description}|" today today)

# Split the string based on the delimiter, ':'
readarray -d '|' -t strarr <<< "$event"
printf "\n"

# Print each value of the array by using loop
for (( n=0; n < ${#strarr[*]}; n++))
do

  event_name=$(echo "${strarr[n]}" | grep -oP '$(date +%H:%M)')

  if [[ "$event_name" != "" ]]; then
    event_name=$(echo "${strarr[n]}" | grep -oP '(?<=\d\d:\d\d::)[^::]+')
    url=$(echo "${strarr[n]}" | grep -oP 'http[s]*://[^>]+')

    notify-send "Reunião Agora" "$event_name" -i /usr/share/icons/Papirus-Dark/16x16/apps/calendar.svg
  fi
done

