# start atuin (can't be deferred in plugins)
# zsh vi-mode/atuin temp fix https://github.com/atuinsh/atuin/issues/977
zvm_after_init_commands+=(eval "$(atuin init zsh --disable-up-arrow)")

# zsh plugins
eval "$(sheldon source)"

# autostart hyprland or zellij
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  dbus-run-session Hyprland
fi


