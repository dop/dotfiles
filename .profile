# print_colors() {
#     local LIMIT=$1
#     if [ -z $LIMIT ]; then
#         LIMIT=255
#     fi
#     for N in `seq 0 $LIMIT`; do
#         echo -n "$(printf '%3d' $N) $(tput setab $N)   $(tput sgr0) "
#         [ $(((N + 1) % 5)) -eq 0 ] && echo ""
#     done
#     echo
# }

RED="\[$(tput setab 1)\]"
GREEN="\[$(tput setaf 112)\]"
BLUE="\[$(tput setab 27)\]"
GRAY="\[$(tput setaf 8)\]"
RESET="\[$(tput sgr0)\]"

prompt_command() {
    local EXIT="$?"
    PS1=""
    if [ $EXIT != 0 ]; then
        PS1+="${RED} ${EXIT} ${RESET}"
    fi
    PS1+="${BLUE}\W${RESET}"
    BRANCH=`git rev-parse --abbrev-ref HEAD 2>/dev/null`
    if [ $? == 0 ]; then
        PS1+=" \342\216\207 ${GREEN}${BRANCH}${RESET}"
    fi
    PS1+=" ${GRAY}\342\206\222${RESET} "
}

export PROMPT_COMMAND=prompt_command

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH="$HOME/perl5/bin${PATH:+:${PATH}}";
export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}";
export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}";
export PERL_MB_OPT="--install_base \"$HOME/perl5\"";
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5";

PATH=$PATH:/usr/local/bin
PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/.cabal/bin
PATH=$PATH:$HOME/.gem/ruby/2.3.0/bin
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:/usr/local/cuda/bin

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64

### Added by the Heroku Toolbelt
PATH=/usr/local/heroku/bin:$PATH

export LATEST_JDK=`ls -1 /Library/Java/JavaVirtualMachines | tail -n1`
export JAVA_HOME=/Library/Java/JavaVirtualMachines/${LATEST_JDK}/Contents/Home

export NVM_DIR=~/.nvm
. /usr/local/opt/nvm/nvm.sh

if [ -f ".profile_personal" ]; then
   . .profile_personal
fi

. $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
eval `opam config env`

export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools/bin

function emulator {
    cd $ANDROID_HOME/tools
    ./emulator $*
}
