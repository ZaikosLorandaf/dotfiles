$HOME/.screenlayout/defaultscr.sh &
makewall &
picom &
# polybar &

if [[ $(tty) = /dev/tty1 ]]; then
while true; do
  dwm >/dev/null
done
fi

