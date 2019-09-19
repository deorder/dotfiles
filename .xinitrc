#!/bin/bash

# Deorder: Turn on numlock
numlockx on &

# Deorder: Disable beep
xset b off

# Deorder: Disable screensaver
xset s off
xset s noblank

# Deorder: Set mouse paramaters
xset m 3/2 6

# Deorder: Set keyboard paramaters
xset r rate 320 35

# Deorder: Set cursor and background
xsetroot -cursor_name left_ptr &
#hsetroot -tile ${HOME}/.wallpaper.png &
hsetroot -cover ${HOME}/.wallpaper.png &

# Deorder: Let mouse pointer hide when typing
unclutter -grab -noevents -root &

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Deorder: Keep the primary in sync with the clipboard buffer.
autocutsel -selection PRIMARY -fork

# Deorder: Keep the clipboard in sync with the primary buffer.
autocutsel -selection CLIPBOARD -fork

# Deorder: Merge custom xresource settings
[[ -f ~/.xresources ]] && xrdb -merge ${HOME}/.xresources

# Deorder: Enable desktop effects
compton --config ${HOME}/.comptonrc &

# Deorder: Fix render issues
wmname LG3D

# Deorder: Run programs
polybar -c ${HOME}/.polybarrc top &
sxhkd -c ${HOME}/.sxhkdrc &
bspwm -c ${HOME}/.bspwmrc
#mate-session
