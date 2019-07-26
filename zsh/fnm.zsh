path+=/home/kuba/.fnm/current/bin
export FNM_MULTISHELL_PATH=/home/kuba/.fnm/current
export FNM_DIR=/home/kuba/.fnm
export FNM_NODE_DIST_MIRROR=https://nodejs.org/dist
export FNM_LOGLEVEL=info

      autoload -U add-zsh-hook
      _fnm_autoload_hook () {
        if [[ -f .node-version && -r .node-version ]]; then
          echo "fnm: Found .node-version"
          fnm use
        elif [[ -f .nvmrc && -r .nvmrc ]]; then
          echo "fnm: Found .nvmrc"
          fnm use
        fi
      }

      add-zsh-hook chpwd _fnm_autoload_hook \
        && _fnm_autoload_hook
    

