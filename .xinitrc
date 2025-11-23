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
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh &

while true; do
  dwm >/dev/null
done
