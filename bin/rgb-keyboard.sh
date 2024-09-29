#!/usr/bin/env bash

keyboardScript="~/.config/acerSense/facer_rgb.py"

if [ $# -lt 1 ]; then
  for ((i = 1; i <= 4; i++)); do
    eval "${keyboardScript} -m 0 -z ${i} -cR 22 -cB 200 -cG 22 -b 100"
  done
else
  primaryColor="${1}"
  r_dec=$(printf "%d" "0x${primaryColor:0:2}")
  b_dec=$(printf "%d" "0x${primaryColor:4:2}")
  g_dec=$(printf "%d" "0x${primaryColor:2:2}")

  for ((i = 1; i <= 4; i++)); do
    eval "${keyboardScript} -m 0 -z ${i} -cR ${r_dec} -cB ${b_dec} -cG ${g_dec} -b 100"
  done
fi
