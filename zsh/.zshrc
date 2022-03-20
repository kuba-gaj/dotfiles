# set +o noclobber
# zmodload zsh/zprof

# zsh plugin manager
source $ZDOTDIR/zplugrc

# Aliases
al() { alias | rg "$1" }
alias vi='nvim'
alias vim='nvim'
alias nv='neovide --multigrid'

# docked mode
alias lap='_ systemctl start udevmon; light -S 30'
alias desk='_ systemctl stop udevmon; light -S 100'

# Tools
alias ls='exa --icons'
alias la='ls -a'
alias l='ls -1'
alias ll='ls -l'
alias lla='ls -la'
# or exa (todo: remove one)

alias cat='bat --paging=never'

alias yrun='script=$(cat package.json | jq -r ".scripts | keys[]" | sort | fzf --height 20%) && yarn $script'

# use trash-cli
alias rm='echo "This is not the command you are looking for."; false'
alias trp='trash-put'
alias tre='trash-empty'
alias trl='trash-list'
alias trr='trash-restore'
alias trrm='trash-remove'

# alias git=hub
# alias gpr=git pull-request

# Undistract-me (not working)
# source /usr/share/undistract-me/long-running.bash
# notify_when_long_running_commands_finish_install

# Navi widget (C-G)
source <(navi widget zsh)

eval $(thefuck --alias)
eval "$(scmpuff init -s)"
# eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"

# autostart sway
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  # XKB_DEFAULT_LAYOUT=us exec sway -d 2>| ~/sway.log
  XKB_DEFAULT_LAYOUT=us exec sway -V 2>| ~/sway.log
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source "$HOME/.homesick/repos/homeshick/homeshick.sh"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# nvm
source /usr/share/nvm/init-nvm.sh
nvm use 14

# tabtab source for serverless package
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# function precmd () {
  # window_title="\033]0;${PWD##*/}\007"
  # echo -ne "$window_title"
  # echo "^Title"
#   print -Pn "\e]0;%~\a"
# }
