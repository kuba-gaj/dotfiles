# eval "$(fnm env --multi)"

# autoload -U add-zsh-hook
# _fnm_autoload_hook() {
#   if [[ -f .node-version && -r .node-version ]]; then
#     echo "fnm: Found .node-version"
#     fnm use
#   elif [[ -f .nvmrc && -r .nvmrc ]]; then
#     echo "fnm: Found .nvmrc"
#     fnm use
#   fi
# }

# add-zsh-hook chpwd _fnm_autoload_hook &&
#   _fnm_autoload_hook
