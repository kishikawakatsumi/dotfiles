export LC_ALL="en_US.UTF-8"

eval "$(rbenv init -)"
eval "$(nodenv init -)"

GIT_PS1_SHOWDIRTYSTATE=true
PS1='\[\033[32m\]\u:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
source ~/.swift-package-complete.bash

# >>>> Vagrant command completion (start)
. /opt/vagrant/embedded/gems/2.2.10/gems/vagrant-2.2.10/contrib/bash/completion.sh
# <<<<  Vagrant command completion (end)
