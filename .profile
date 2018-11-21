export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG="en_US.UTF-8"

export PATH="$HOME/perl5/bin${PATH:+:${PATH}}";
export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}";
export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}";
export PERL_MB_OPT="--install_base \"$HOME/perl5\"";
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5";

PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/.cabal/bin
PATH=$PATH:$HOME/.gem/ruby/2.3.0/bin
PATH=$PATH:$HOME/.local/bin
if [ -f "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ]; then
    PATH=$PATH:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export MANPATH="/opt/local/share/man:$MANPATH"

export EDITOR=emacsclient
export REACT_EDITOR=emacsclient

export NVM_DIR=$HOME/nvm
. $NVM_DIR/nvm.sh

echo node `node -v`, npm: `npm -v`

### Added by the Heroku Toolbelt
export PATH=/usr/local/heroku/bin:$PATH

export LATEST_JDK=`ls -1 /Library/Java/JavaVirtualMachines | tail -n1`
if [ ! -z $LATEST_JDK ]; then
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/${LATEST_JDK}/Contents/Home
fi

if [ -f ".profile_personal" ]; then
   . .profile_personal
fi

. $HOME/.opam/opam-init/init.sh

ANDROID_HOME=$HOME/Library/Android/sdk
if [ -d $ANDROID_HOME ]; then
    export ANDROID_HOME
    export PATH=$PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools/bin
fi

function emulator {
    cd $ANDROID_HOME/tools
    ./emulator $*
}
