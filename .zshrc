setopt PROMPT_SUBST
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

export PROMPT="%F{green}${USER}:%f%F{blue}%(5~|%-1~/…/%3~|%4~)%f%F{red}\$(__git_ps1)%f%(!.#.$) "

autoload -U compinit
compinit -u
fpath=(~/.zsh $fpath)

source $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

export GPG_TTY=$(tty)

fpath=(/opt/vagrant/embedded/gems/2.2.10/gems/vagrant-2.2.10/contrib/zsh $fpath)
compinit

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
