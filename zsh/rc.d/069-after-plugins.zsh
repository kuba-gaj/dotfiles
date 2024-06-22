# fix mr: https://github.com/1Password/shell-plugins/pull/464
# another approach:
# https://github.com/jimeh/dotfiles/blob/f30c675f3b5cebd6a0b58be3905425e50d1b4ba3/zsh/1password.zsh
# 1password breaks completions with their aliases
# alias glab='op plugin run -- gh' --> this triggers _op_plugin_run completion
# 1. Checks if the previous word is --
# 2. Takes -- and everything prior to it out of the scope of the completion
# 3. completes as normal from the first argument after --.
# https://1password.community/discussion/138575/zsh-plugin-aliases-break-completion-for-the-command-run-by-the-plugin
# https://github.com/99designs/aws-vault/blob/master/contrib/completions/zsh/aws-vault.zsh

# znap eval op 'op completion zsh'
# znap fpath '_op' 'op completion zsh'
source "$XDG_CONFIG_HOME/op/plugins.sh"
# Fix 1pass plugins completions
# znap source jimeh/dotfiles zsh/1password.zsh

function _op_plugin_run_fix() {
    for (( i=2; i < CURRENT; i++ )); do
        if [[ ${words[i]} == -- ]]; then
            shift $i words
            (( CURRENT -= i ))
            _normal
            return
        fi
    done

    # run original op completion
    _op
}

function __load_op_completion() {
  local op_completion_fn="$(op completion zsh)"
  local fix_fn="$(which _op_plugin_run_fix)"

  # replace all references to _op with _op_plugin_run_fix (except for the function definition)
  local patched_op=$(sed -E -e 's/\b_op\b([^()]|$)/_op_plugin_run_fix\1/g' <<< $op_completion_fn)

  echo -e "$patched_op\n\n$fix_fn"
}
export BASH_COMP_DEBUG_FILE="/home/kuba/tmp/op_completion.log"

# znap fpath '_op' '__load_op_completion'
znap eval op '__load_op_completion'
