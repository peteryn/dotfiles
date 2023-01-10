# startup scripts
#zsh ~/.config/bin/update.sh 

# disable terminal beep
unsetopt prompt_cr prompt_sp BEEP

#add color 
autoload -U colors && colors

# prompt
PS1="%B%{$fg[blue]%}[%{$fg[green]%}%~%{$fg[blue]%}]%{$reset_color%}$%b "

# git shortcuts
autoload -Uz compinit && compinit

# simple keymaps
alias ls='ls --color=auto'
alias vi='vim'
alias cu='curl -O'
alias pm='python manage.py'
alias size='du -sh'
alias nf='clear;neofetch'
alias tetris='autoload -Uz tetriscurses;tetriscurses'
#alias hacker='unimatrix -n -s 96 -l o'
#alias usage='sh ~/.config/bin/usage.sh'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

#setxkbmap -option caps:escape

# setup vim keybinds for autocomplete
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# Include hidden files in autocomplete:
_comp_options+=(globdots)

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# starship prompt
eval "$(starship init zsh)"
