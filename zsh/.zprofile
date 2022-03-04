export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"
export READER="zathura"
export FILE="vifm"
# Kill the lag after <ESC> (https://dougblack.io/words/zsh-vi-mode.html)
export KEYTIMEOUT=1

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
# PATH
# Adds `~/.local/bin/` and all subdirectories to $PATH
export PATH="$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):$PATH"
path=("./node_modules/.bin" $path)
path=("$(npm bin)" $path)
path=("$GOBIN" $path)
path+=("$HOME/.node_modules/bin")
path+="$HOME/.yarn/bin"

# node
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NPM_TOKEN=$(cat $NPM_CONFIG_USERCONFIG | grep _authToken | sed 's/.*=//')
# HIDE LEGACY DOCKER COMMANDS
export DOCKER_HIDE_LEGACY_COMMANDS=true

export KITTY_LISTEN_ON=/tmp/mykitty
export KITTY_CONFIG_DIRECTORY=$XDG_CONFIG_HOME/kitty

#  zettlekasten notes with zk
export ZK_NOTEBOOK_DIR=$HOME/notes

# Homebrew
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
# export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
# export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
# export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
# export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"

# prepand for tfenv
path+=("/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin")

# Wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORM="wayland;xcb"
export MOZ_ENABLE_WAYLAND=1
export MOZ_DBUS_REMOTE=1
# older version of qt
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

if [ -f $ZDOTDIR/.zshenv.priv ]; then
  source $ZDOTDIR/.zshenv.priv
fi

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# If you need to have python@3.7 first in your PATH run:
#   echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/python@3.7/bin:$PATH"' >> ~/.zshrc

# For compilers to find python@3.7 you may need to set:
#   export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/python@3.7/lib"
#   export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/python@3.7/include"

# For pkg-config to find python@3.7 you may need to set:
#   export PKG_CONFIG_PATH="/home/linuxbrew/.linuxbrew/opt/python@3.7/lib/pkgconfig"

