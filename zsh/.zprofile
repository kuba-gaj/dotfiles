# remove files from trash older than 5 days
if [ -x "$(command -v trash-empty)" ]; then
  trash-empty -f 5
fi

# autostart hyprland
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  dbus-run-session Hyprland
fi

