# Set colors to match iTerm2 Terminal Colors
# export TERM=xterm-256color

# Kill the lag after <ESC> (https://dougblack.io/words/zsh-vi-mode.html)
export KEYTIMEOUT=1
export EDITOR=vim
export npm_config_prefix=~/.node_modules

# PATH (can't be done in env because it's overriden later in /etc/profile by arch)
path=('/home/kuba/.local/bin' $path)
path=('/home/kuba/.node_modules/bin', $path)
path=("/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin", $path)
path+="$HOME/.yarn/bin"
path+="/Users/kuba/Library/Python/2.7/bin"

source ~/.fresh/build/shell.sh
source ~/.dotfiles/zplugrc

# Visual indication of NORMAL mode in PURE theme using prezto/editor module
PROMPT='%(?.%F{magenta}.%F{red})${editor_info[keymap]} '

# dircolors
eval `dircolors $ZPLUG_HOME/repos/seebi/dircolors-solarized/dircolors.256dark`
# eval `dircolors $ZPLUG_HOME/repos/seebi/dircolors-solarized/dircolors.256dark`

# Aliases
al() { alias | rg "$1" }

alias vi='vim -u ~/.dotfiles/vim/vimrc_light'
alias vim='nvim -u ~/.dotfiles/vim/vimrc_ide'

# docked mode
alias lap='_ systemctl start udevmon'
alias desk='_ systemctl stop udevmon'

# Tools
alias git=hub
[ -f ~/.dotfiles/fzf.zsh ] && source ~/.dotfiles/fzf.zsh
source ~/.dotfiles/fasd.zsh

# Cni
alias terra='aws-okta exec okta-developer-staging -- terraform'
alias _terra-eu='aws-okta exec okta-developer-prod -- terraform'
alias _terra-ap='aws-okta exec prod-ap-dev -- terraform'

# Undistract-me
source /usr/share/undistract-me/long-running.bash
notify_when_long_running_commands_finish_install

