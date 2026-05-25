alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ls='ls --color=auto'
alias python='python3'
alias vi='nvim'

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

export PATH="~/.local/share/flatpak/exports/bin:/var/lib/flatpak/exports/bin:$PATH"
export PATH="$PATH:~/go/bin"
eval "$(starship init bash)"
