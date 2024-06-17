# node
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NPM_TOKEN=$(cat $NPM_CONFIG_USERCONFIG | grep _authToken | sed 's/.*=//')
path+=("./node_modules/.bin")
path+=("$HOME/.node_modules/bin")
path+="$HOME/.yarn/bin"
znap eval fnm 'fnm env --use-on-cd'

# docker
export DOCKER_HIDE_LEGACY_COMMANDS=true

# rust
path+=("$HOME/.cargo/bin")

# go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
path+=("$GOBIN")

# python
[[ -d $PYENV_ROOT/bin ]] && path+="$PYENV_ROOT/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
znap eval pyenv 'pyenv init -'
znap eval pipx-argcomplete 'register-python-argcomplete pipx'


