# remove files from trash older than 5 days
if [ -x "$(command -v trash-empty)" ]; then
  trash-empty -f 5
fi

# remove tmux sessions except last 12
ls -t /home/kuba/.local/share/tmux/resurrect | tail -n +13 | xargs -d '\n' -I {} rm -v "/home/kuba/.local/share/tmux/resurrect/{}"

# autostart hyprland
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec Hyprland
fi

