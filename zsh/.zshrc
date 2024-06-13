eval "$(zoxide init zsh)"

# fnm
eval "$(fnm env --use-on-cd)"

# autostart hyprland or zellij
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  dbus-run-session Hyprland
  # exec Hyprland
# or zellij
else
  # If the zellij session already exists, attach to the default session. (not starting as a new session)
  export ZELLIJ_AUTO_ATTACH=false
  export ZELLIJ_AUTO_EXIT=false
  eval "$(zellij setup --generate-auto-start zsh)"
fi

# start starship prompt
eval "$(starship init zsh)"

# start atuin
# zsh vi-mode/atuin temp fix https://github.com/atuinsh/atuin/issues/977
zvm_after_init_commands+=(eval "$(atuin init zsh --disable-up-arrow)")

# bun completions
[ -s "/home/kuba/.config/sst/_bun" ] && source "/home/kuba/.config/sst/_bun"

# copilot cli
eval "$(gh copilot alias -- zsh)"

# direnv
eval "$(direnv hook zsh)"

# python
eval "$(pyenv init -)"
eval "$(register-python-argcomplete pipx)"

# scm breeze for improved git
[ -s "/usr/share/scm_breeze/scm_breeze.sh" ] && source "/usr/share/scm_breeze/scm_breeze.sh"

# run last
# sheldon
eval "$(sheldon source)"
