# remove files from trash older than 5 days
trash-empty -f 5

# autostart hyprland
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  dbus-run-session Hyprland
fi
