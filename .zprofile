export LC_ALL="en_US.UTF-8"

eval "$(/opt/homebrew/bin/brew shellenv)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi
