setopt PROMPT_SUBST
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

export PROMPT="%F{green}${USER}:%f%F{blue}%(5~|%-1~/…/%3~|%4~)%f%F{red}\$(__git_ps1)%f%(!.#.$) "

autoload -U compinit
compinit -u
