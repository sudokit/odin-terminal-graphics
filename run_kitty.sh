#/bin/bash

if [ "$#" -ne 6 ]; then
    echo "Invalid number of params. params are:"
    printf "\t width: window width\n"
    printf "\t height: window height\n"
    printf "\t repaint_delay: how often should kitty repaint (ms)\n"
    printf "\t font_size: size of the current font\n"
    printf "\t vsync: well... vsync\n"
    printf "\t runnable: what executable to run inside kitty\n"
    exit 1
fi

width="$1"
height="$2"
repaint_delay="$3"
font_size="$4"
vsync="$5"
runnable="$6"

kitty -o initial_window_width="$width" -o initial_window_height="$height" -o remember_window_size=no -o sync_to_monitor="$vsync" -o repaint_delay="$repaint_delay" -o font_family=monospace -o modify_font="cell_height 50%" -o font_size="$font_size" -o placement_strategy=center bash -c "$runnable"
