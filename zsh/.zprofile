export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"
export READER="zathura"
export FILE="lf"
# Kill the lag after <ESC> (https://dougblack.io/words/zsh-vi-mode.html)
export KEYTIMEOUT=1

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
# PATH
# Adds `~/.local/bin/` and all subdirectories to $PATH
export PATH="$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):$PATH"
path+=("./node_modules/.bin")
path+=("$(npm bin)")
path+=("$GOBIN")
path+=("$HOME/.node_modules/bin")
path+="$HOME/.yarn/bin"
path+=("$HOME/.cargo/bin")

# node
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NPM_TOKEN=$(cat $NPM_CONFIG_USERCONFIG | grep _authToken | sed 's/.*=//')

# docker
export DOCKER_HIDE_LEGACY_COMMANDS=true
# socket for rootless
# export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

export KITTY_LISTEN_ON=/tmp/mykitty
export KITTY_CONFIG_DIRECTORY=$XDG_CONFIG_HOME/kitty

#  zettlekasten notes with zk
export ZK_NOTEBOOK_DIR=$HOME/notes

# enable smooth scrolling, blured backgrounds and window animations
# may be causing some bugs
# export NEOVIDE_MULTIGRID=true

# current folder as tab
# export ZSH_TAB_TITLE_ONLY_FOLDER=true
# export ZSH_TAB_TITLE_CONCAT_FOLDER_PROCESS=true
# export ZSH_TAB_TITLE_ADDITIONAL_TERMS='kitty'
# export ZSH_TAB_TITLE_DEFAULT_DISABLE_PREFIX=true
# export ZSH_TAB_TITLE_PREFIX=""

# Homebrew
# eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
#
# export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
# export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
# export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
# export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
# export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"

# prepand for tfenv
# path+=("/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin")

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

LF_ICONS=$(sed $XDG_CONFIG_HOME/lf/diricons \
            -e '/^[ \t]*#/d'       \
            -e '/^[ \t]*$/d'       \
            -e 's/[ \t]\+/=/g'     \
            -e 's/$/ /')
LF_ICONS=${LF_ICONS//$'\n'/:}
export LF_ICONS

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# remove files from trash older than 5 days
trash-empty -f 5

# If you need to have python@3.7 first in your PATH run:
#   echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/python@3.7/bin:$PATH"' >> ~/.zshrc

# For compilers to find python@3.7 you may need to set:
#   export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/python@3.7/lib"
#   export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/python@3.7/include"

# For pkg-config to find python@3.7 you may need to set:
#   export PKG_CONFIG_PATH="/home/linuxbrew/.linuxbrew/opt/python@3.7/lib/pkgconfig"

# python
# Created by `pipx` on 2024-06-11 18:48:21
export PATH="$PATH:/home/kuba/.local/bin"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && path+="$PYENV_ROOT/bin:$PATH"

# tools
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgrep
