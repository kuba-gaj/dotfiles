# node
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NPM_TOKEN=$(cat $NPM_CONFIG_USERCONFIG | grep _authToken | sed 's/.*=//')
path+=("./node_modules/.bin")
path+=("$HOME/.node_modules/bin")
path+="$HOME/.yarn/bin"

# docker
export DOCKER_HIDE_LEGACY_COMMANDS=true
# socket for rootless
# export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# rust
path+=("$HOME/.cargo/bin")

# go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
path+=("$GOBIN")

# python
eval "$(register-python-argcomplete pipx)"
[[ -d $PYENV_ROOT/bin ]] && path+="$PYENV_ROOT/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"


