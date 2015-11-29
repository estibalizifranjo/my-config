alias ls="ls --color=auto"
alias mkdir="mkdir -p"
alias cp="cp -r"
alias scp="scp -r"
alias fuck='sudo $(fc -ln -1)'
alias vi="vim"
alias wget="curl -O --retry 999 --retry-max-time 0 -C -"
alias ggraph='git log --oneline --graph --decorate --all --date-order'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

