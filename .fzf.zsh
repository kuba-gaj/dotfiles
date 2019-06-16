# FZF respect version control ignore files excluding hidden files
export FZF_DEFAULT_COMMAND='fd --type file --hidden --exclude .git --color always'
export FZF_CTRL_T COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--ansi'

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
