# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Kill the lag after <ESC> (https://dougblack.io/words/zsh-vi-mode.html)
export KEYTIMEOUT=1
export EDITOR=vim

# PATH (can't be done in env because it's overriden later in /etc/profile)
path=('/home/kuba/.local/bin' $path)
path=("/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin", $path)
path+="$HOME/.yarn/bin"
path+="/Users/kuba/Library/Python/2.7/bin"

source ~/.dotfiles/.zpreztorc
source ~/.dotfiles/.zplugrc
source ~/.fresh/build/shell.sh

# Visual indication of NORMAL mode in PURE theme using prezto/editor module
PROMPT='%(?.%F{magenta}.%F{red})${editor_info[keymap]} '

# dircolors
eval `dircolors $ZPLUG_HOME/repos/seebi/dircolors-solarized/dircolors.256dark`

# Aliases
al() { alias | grep "$1" }

# docked mode
alias lap='_ systemctl start udevmon'
alias desk='_ systemctl stop udevmon'

# Tools
alias git=hub
alias ag='ag --ignore .git'
[ -f ~/.dotfiles/.fzf.zsh ] && source ~/.dotfiles/.fzf.zsh

# Cni
alias terra='aws-okta exec okta-developer-staging -- terraform'
alias _terra-eu='aws-okta exec okta-developer-prod -- terraform'
alias _terra-ap='aws-okta exec prod-ap-dev -- terraform'

# Undistract-me
source /usr/share/undistract-me/long-running.bash
notify_when_long_running_commands_finish_install

# fasd https://github.com/clvv/fasd
eval "$(fasd --init auto)"
# defaults
# alias a='fasd -a'        # any
# alias s='fasd -si'       # show / search / select
# source /etc/profile.d/autojump.bash
# source /etc/profile.d/autojump.bashy
# alias f='fasd -f'        # file
# alias sd='fasd -sid'     # interactive directory selection
# alias sf='fasd -sif'     # interactive file selection
# alias z='fasd_cd -d'     # cd, same functionality as j in autojump
# alias zz='fasd_cd -d -i' # cd with interactive selection
# # extrra
# alias v='f -e vim' # quick opening files with vim
# alias o='a -e xdg-open' # quick opening files with xdg-open

