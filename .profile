export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG="en_US.UTF-8"

export PATH="$HOME/.local/bin:/opt/local/bin:/opt/local/sbin:$PATH"
export MANPATH="/opt/local/share/man:$MANPATH"
if [ -d "/opt/local/lib/ImageMagick7/bin" ]; then
    export PATH="/opt/local/lib/ImageMagick7/bin:$PATH"
fi

export EDITOR=emacsclient
export REACT_EDITOR=emacsclient

export NVM_DIR="$HOME/software/nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
  . "$NVM_DIR/nvm.sh"
else
  eval "$(fnm env --shell zsh)"
fi

type node >/dev/null && echo node: `node -v`, npm: `npm -v`
export NODE_OPTIONS="--max-old-space-size=8192"

PRIVATE="$HOME/.profile_personal"
if [ -f $PRIVATE ]; then
   source $PRIVATE
fi

if [ -x "$(which direnv)" ]; then
    eval "$(direnv hook zsh)"
fi

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-21-amazon-corretto.jdk/Contents/Home
export PATH="$PATH:$JAVA_HOME/bin"

#export ANDROID_HOME=/opt/homebrew/share/android-commandlinetools
#export ANDROID_PLATFORM_TOOLS=/opt/homebrew/bin

#source "$HOME/.bazelenv"

WORK_ENV="$HOME/work/profile.sh"
if [ -f "$WORK_ENV" ]; then
    source $WORK_ENV
fi
