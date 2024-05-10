$HOME/.screenlayout/defaultscr.sh &
makewall &
picom &
xrdb -load ~/.Xresources &
remaps &
dunst &
xset r rate 300 50 &

if [[ $(tty) = /dev/tty1 ]]; then
while true; do
  dwm >/dev/null
done
fi

