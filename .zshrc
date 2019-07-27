# zmodload zsh/zprof

# Kill the lag after <ESC> (https://dougblack.io/words/zsh-vi-mode.html)
export KEYTIMEOUT=1
export EDITOR=vim
# PATH (can't be done in env because it's overriden later in /etc/profile by arch)
# prepand for tfenv
path=("/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin" $path)
path+="$HOME/.local/bin"
path+=("$HOME/.node_modules/bin")
path+="$HOME/.yarn/bin"
path+=("$HOME/go/bin")

# fast node manager
source ~/.dotfiles/zsh/fnm.zsh
# zsh plugin manager
source ~/.dotfiles/zsh/zplugrc

# dircolors
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
[ -f ~/.dotfiles/zsh/fzf.zsh ] && source ~/.dotfiles/zsh/fzf.zsh
source ~/.dotfiles/zsh/fasd.zsh

# Cni
alias terra='aws-okta exec okta-developer-staging -- terraform'
alias _terra-eu='aws-okta exec okta-developer-prod -- terraform'
alias _terra-ap='aws-okta exec prod-ap-dev -- terraform'

# Undistract-me (not working)
# source /usr/share/undistract-me/long-running.bash
# notify_when_long_running_commands_finish_install

eval $(thefuck --alias)
