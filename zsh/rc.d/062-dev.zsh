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
# vitualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source '/usr/bin/virtualenvwrapper.sh'
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && path=("$PYENV_ROOT/bin" $path)
znap eval pyenv 'pyenv init -'
znap eval pipx-argcomplete 'register-python-argcomplete pipx'

# lua5.1 is in /usr/local/bin
export LUAROCKS_CONFIG="$XDG_CONFIG_HOME/luarocks/config-5.4.lua"
# TODO: this unsets some PATH like the one for fnm
# znap eval luarocks 'luarocks path'

# git
export GITLAB_HOST="gitlab.trint.io"
znap eval scmpuff 'scmpuff init -s --aliases=false'
alias gs='scmpuff_status'
znap fpath '_glab' 'glab completion -s zsh'

# aws
export AWS_PROFILE='trint-dev'
complete -C aws_completer aws

