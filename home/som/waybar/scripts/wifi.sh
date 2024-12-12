#!/usr/bin/env bash

quality=$(iwconfig 2> /dev/null | awk '
  /Link Quality/ {
    split($0, a, "=")
    split(a[2], b, "/")
    current_link_quality = b[1]
    max_link_quality = b[2]
    link_quality_percent = (current_link_quality / max_link_quality) * 100
    printf("%d\n", int(link_quality_percent + 0.5))
  }
')

if (( "$quality" >= 0 && "$quality" < 20 )); then
  echo /home/som/.config/waybar/assets/wifi0.png
elif (( "$quality" >= 20 && "$quality" < 40 )); then
  echo /home/som/.config/waybar/assets/wifi1.png
elif (( "$quality" >= 40 && "$quality" < 60 )); then
  echo /home/som/.config/waybar/assets/wifi2.png
elif (( "$quality" >= 60 && "$quality" < 80 )); then
  echo /home/som/.config/waybar/assets/wifi3.png
elif (( "$quality" >= 80 && "$quality" <= 100 )); then
  echo /home/som/.config/waybar/assets/wifi3.png
fi
