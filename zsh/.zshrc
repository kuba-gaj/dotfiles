# zmodload zsh/zprof
# zsh -l --sourcetrace
# zsh plugins
eval "$(sheldon source)"

# autostart hyprland
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  dbus-run-session Hyprland
fi

# start atuin (can't be deferred in plugins)
# zsh vi-mode/atuin temp fix https://github.com/atuinsh/atuin/issues/977
zvm_after_init_commands+=(eval "$(atuin init zsh --disable-up-arrow)")

# zprof
