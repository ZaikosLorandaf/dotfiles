$HOME/.screenlayout/defaultscr.sh &
makewall &
picom &
xrdb -load ~/.Xresources &
remaps &
dunst &

if [[ $(tty) = /dev/tty1 ]]; then
while true; do
  dwm >/dev/null
done
fi

