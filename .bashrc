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

function prompt_command() {
    local EXIT="$?"
    PS1=""
    if [ $EXIT != 0 ]; then
        PS1+="${RED} ${EXIT} ${RESET}"
    fi
    PS1+="${BLUE}\W${RESET}"
    BRANCH=`git rev-parse --abbrev-ref HEAD 2>/dev/null`
    if [ $? == 0 ]; then
        GAP=
        if [ -z $INSIDE_EMACS ]; then
            GAP=" "
        fi
        if [ $BRANCH == "master" ]; then
            BRANCH=
        fi
        PS1+=" \342\216\207${GAP}${GREEN}${BRANCH}${RESET}"
    fi
    PS1+=" ${GRAY}\342\206\222${RESET} "
}

PROMPT_COMMAND="prompt_command"

# if [ -z $INSIDE_EMACS ]; then
# else
#     PROMPT_COMMAND=""
#     PS1="\W % "
# fi
