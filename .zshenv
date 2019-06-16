export FRESH_RCFILE="$HOME/.dotfiles/.freshrc"

export NPM_TOKEN=$(cat ~/.npmrc | grep _authToken | sed 's/.*=//')

# TMUXP
export TMUXP_CONFIGDIR=~/.dotfiles/tmuxp

# HIDE LEGACY DOCKER COMMANDS
export DOCKER_HIDE_LEGACY_COMMANDS=true

# Homebrew
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"

# CNI
<<<<<<< HEAD
export AWS_OKTA_BACKEND=secret-service
=======
export AWS_OKTA_BACKEND=secret-service

source .zshenvpriv
>>>>>>> 295a970b5b75a6503b6fb9330c3ab1868403adcf
