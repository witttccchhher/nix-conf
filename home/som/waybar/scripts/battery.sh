#!/usr/bin/env bash

battery=$(upower --enumerate | head -1)
percentage=$(upower -i $battery | awk '/percentage/{gsub("%", ""); print $2}')

if (( "$percentage" >= 0 && "$percentage" < 13 )); then
  echo /home/som/.config/waybar/assets/battery0.png
elif (( "$percentage" >= 13 && "$percentage" < 25 )); then
  echo /home/som/.config/waybar/assets/battery1.png
elif (( "$percentage" >= 25 && "$percentage" < 38 )); then
  echo /home/som/.config/waybar/assets/battery2.png
elif (( "$percentage" >= 38 && "$percentage" < 50 )); then
  echo /home/som/.config/waybar/assets/battery3.png
elif (( "$percentage" >= 50 && "$percentage" < 63 )); then
  echo /home/som/.config/waybar/assets/battery4.png
elif (( "$percentage" >= 63 && "$percentage" < 75 )); then
  echo /home/som/.config/waybar/assets/battery5.png
elif (( "$percentage" >= 75 && "$percentage" < 88 )); then
  echo /home/som/.config/waybar/assets/battery6.png
elif (( "$percentage" >= 88 && "$percentage" <= 100 )); then
  echo /home/som/.config/waybar/assets/battery6.png
fi
