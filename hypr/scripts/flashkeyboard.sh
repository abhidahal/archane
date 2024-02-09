#!/usr/bin/env sh

# set variables

export ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/globalcontrol.sh
keyboardScript="~/.config/acer-predator-turbo-and-rgb-keyboard-linux-module/facer_rgb.py"
getWall=`grep '^1|' "$ThemeCtl" | awk -F '|' '{print $NF}'`
export cacheImg=$(basename "${getWall}")



# color conversion functions
dark_light () {
    inCol="$1"
    red=$(printf "%d" "0x${inCol:1:2}")
    green=$(printf "%d" "0x${inCol:3:2}")
    blue=$(printf "%d" "0x${inCol:5:2}")
    brightness=$((red + green + blue))
    [ "$brightness" -lt 300 ]
}

fn_keyboardColorChange(){
    source "${cacheDir}/${gtkTheme}/${cacheImg}.dcol"
    mainColor="${dcol_2xa4}"

    if dark_light "#${mainColor}" ; then
      r_dec=$((16#${mainColor:0:2}))
      g_dec=$((16#${mainColor:2:2}))
      b_dec=$((16#${mainColor:4:2}))
        eval   "${keyboardScript} -m 1 -s 4 -b 100 -cR ${r_dec} -cB ${b_dec} -cG ${g_dec} && sleep 3"
      for ((i = 1; i <= 4; i++)); do
        eval   "${keyboardScript} -m 0 -z ${i} -cR ${r_dec} -cB ${b_dec} -cG ${g_dec}"
        done
    else
      r_dec=$((16#${dcol_pry0:0:2}))
      g_dec=$((16#${dcol_pry0:2:2}))
      b_dec=$((16#${dcol_pry0:4:2}))
        eval   "${keyboardScript} -m 1 -s 4 -b 100 -cR ${r_dec} -cB ${b_dec} -cG ${g_dec} && sleep 3"
      for ((i = 1; i <= 4; i++)); do
        eval   "${keyboardScript} -m 0 -z ${i} -cR ${r_dec} -cB ${b_dec} -cG ${g_dec}"
        done
    fi
}

fn_keyboardColorChange
