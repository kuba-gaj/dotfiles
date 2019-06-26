# fasd https://github.com/clvv/fasd
# init is done with prezto module
# eval "$(fasd --init auto)"
# defaults
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
# extra
alias v='f -e vim' # quick opening files with vim
alias o='a -e xdg-open' # quick opening files with xdg-open
