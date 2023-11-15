setopt PROMPT_SUBST
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
export PROMPT="%F{green}${USER}:%f%F{blue}%(5~|%-1~/…/%3~|%4~)%f%F{red}\$(__git_ps1)%f%(!.#.$) "

if [[ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]]; then
  source $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
fi
if [[ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" ]]; then
  source $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
fi

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

fpath=(~/.zsh $fpath)
autoload -Uz compinit
compinit -u
