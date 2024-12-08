$HOME/.screenlayout/defaultscr.sh &
makewall &
picom &
remaps &
sxhkd &
dunst &
dwmblocks &
xset r rate 300 50 &
# xrdb -load ~/.Xresources &
protonmail-bridge-core -n &

while true; do
  dwm >/dev/null
done
