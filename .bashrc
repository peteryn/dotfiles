alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
eval "$(starship init bash)"
alias ls='ls --color=auto'

[ -f "/home/pyuan/.ghcup/env" ] && source "/home/pyuan/.ghcup/env" # ghcup-env