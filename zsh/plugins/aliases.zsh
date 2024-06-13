# nushell
nu() {
  local args\="$@"
  command nu -c "$args"
}

# vim
alias vi='nvim'
alias vim='nvim'
alias nv='neovide --multigrid'

# docked mode
alias lap='_ systemctl start udevmon; light -S 30'
alias desk='_ systemctl stop udevmon; light -S 100'

# exa
alias ls='exa --icons'

# bat
alias cat='bat --paging=never'

# trash-cli
alias rm='echo "This is not the command you are looking for."; false'
alias trp='trash-put'
alias tre='trash-empty'
alias trl='trash-list'
alias trr='trash-restore'
alias trrm='trash-remove'

# ai
alias cb='chatblade -c 4 -s'
alias cb3='chatblade -c 3 -s'

# docker
alias gwa='git worktree add'
alias gwls='git worktree list'
alias gwlck='git worktree lock'
alias gwmv='git worktree move'
alias gwp='git worktree prune'
alias gwdel='git worktree remove'
alias gwr='git worktree repair'
alias gwulck='git worktree unlock'
alias lg='lazygit'

# kubernetes
alias kdhm='kubectl describe HelmChart'
alias kdelhm='kubectl delete HelmChart'
alias kedhm='kubectl edit HelmChart'
alias kghm='kubectl get HelmChart'
alias kdssec='kubectl describe SealedSecret'
alias kdelssec='kubectl delete SealedSecret'
alias kessec='kubectl edit SealedSecret'
alias kgssec='kubectl get SealedSecret'
