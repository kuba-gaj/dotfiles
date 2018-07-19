# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Kill the lag after <ESC> (https://dougblack.io/words/zsh-vi-mode.html)
export KEYTIMEOUT=1
export EDITOR=vim

# prepend pip user path
path=('/home/kuba/.local/bin' $path)

source ~/.dotfiles/.zpreztorc
source ~/.dotfiles/.zplugrc
source ~/.fresh/build/shell.sh

# Visual indication of NORMAL mode in PURE theme using prezto/editor module
PROMPT='%(?.%F{magenta}.%F{red})${editor_info[keymap]} '

# ssh-add ~/.ssh/id_rsa

# dircolors
eval `dircolors $ZPLUG_HOME/repos/seebi/dircolors-solarized/dircolors.256dark`

# Aliases
al() { alias | grep "$1" }

# Tools
alias ag='ag --ignore .git'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# FZF respect version control ignore files excluding hidden files
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# TMUXP
export TMUXP_CONFIGDIR=~/.dotfiles/tmuxp
