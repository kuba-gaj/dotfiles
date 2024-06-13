export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"
export READER="zathura"
export FILE="lf"
# Kill the lag after <ESC> (https://dougblack.io/words/zsh-vi-mode.html)
export KEYTIMEOUT=1

# PATH
# Adds `~/.local/bin/` and all subdirectories to $PATH
export PATH="$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):$PATH"

export KITTY_LISTEN_ON=/tmp/mykitty
export KITTY_CONFIG_DIRECTORY=$XDG_CONFIG_HOME/kitty

# Wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORM="wayland;xcb"
export MOZ_ENABLE_WAYLAND=1
export MOZ_DBUS_REMOTE=1
# older version of qt
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

# LF_ICONS=$(sed $XDG_CONFIG_HOME/lf/diricons \
#             -e '/^[ \t]*#/d'       \
#             -e '/^[ \t]*$/d'       \
#             -e 's/[ \t]\+/=/g'     \
#             -e 's/$/ /')
# LF_ICONS=${LF_ICONS//$'\n'/:}
# export LF_ICONS

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# remove files from trash older than 5 days
trash-empty -f 5
