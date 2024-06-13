eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

# copilot cli
eval "$(gh copilot alias -- zsh)"

# enable smooth scrolling, blured backgrounds and window animations
# may be causing some bugs
# export NEOVIDE_MULTIGRID=true

export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgrep

# FZF respect version control ignore files excluding hidden files
export FZF_DEFAULT_COMMAND='fd --type file --hidden --exclude .git --color always --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--ansi'

# source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

