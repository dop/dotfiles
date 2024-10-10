export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG="en_US.UTF-8"

export PATH="$HOME/.local/bin:/opt/local/bin:/opt/local/sbin:$PATH"
export MANPATH="/opt/local/share/man:$MANPATH"

export EDITOR=emacsclient
export REACT_EDITOR=emacsclient

eval "$(fnm env --shell zsh)"
echo node: `node -v`, npm: `npm -v`
export NODE_OPTIONS="--max-old-space-size=8192"

PRIVATE="$HOME/.profile_personal"
if [ -f $PRIVATE ]; then
   . $PRIVATE
fi

alias npx="npx --no-install"
