export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG="en_US.UTF-8"

PERL_PATH="$HOME/perl"
if [ -d $PERL_PATH ]; then
    export PATH="$PERL_PATH/bin:$PATH"
    export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}";
    export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}";
    export PERL_MB_OPT="--install_base \"$HOME/perl5\"";
    export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5";
fi

if [ -f "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ]; then
    PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi

export PATH="$HOME/.local/bin:/opt/local/bin:/opt/local/sbin:$PATH"
export MANPATH="/opt/local/share/man:$MANPATH"

export EDITOR=emacsclient
export REACT_EDITOR=emacsclient

export NVM_DIR="$HOME/software/nvm"
if [ -d $NVM_DIR ]; then
    . "$NVM_DIR/nvm.sh"
    echo node `node -v`, npm: `npm -v`
fi
export NODE_OPTIONS="--max-old-space-size=4096"

### Added by the Heroku Toolbelt
HEROKU_PATH="/usr/local/heroku/bin"
if [ -d $HEROKU_PATH ]; then
    export PATH="$HEROKU_PATH:$PATH"
fi

if [ -d /Library/Java/JavaVirtualMachines ]; then
    export LATEST_JDK=`ls -1 /Library/Java/JavaVirtualMachines | tail -n1`
    if [ ! -z $LATEST_JDK ]; then
        export JAVA_HOME="/Library/Java/JavaVirtualMachines/${LATEST_JDK}/Contents/Home"
    fi
fi

PRIVATE="$HOME/.profile_personal"
if [ -f $PRIVATE ]; then
   . $PRIVATE
fi

OPAM_INIT=$HOME/.opam/opam-init/init.sh
if [ -f $OPAM_INIT ]; then
   . $OPAM_INIT
fi

ANDROID_HOME="$HOME/Library/Android/sdk"

if [ -d $ANDROID_HOME ]; then
    export ANDROID_HOME
    export PATH="${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools/bin:$PATH"
fi

function emulator {
    cd "$ANDROID_HOME/tools"
    ./emulator $*
}

if [ -f $HOME/.bazelenv ]; then
    source $HOME/.bazelenv
fi

alias npx="npx --no-install"
