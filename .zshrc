RED="%{$(tput setaf 1)%}"
GREEN="%{$(tput setaf 112)%}"
BLUE="%{$(tput setaf 27)%}"
GRAY="%{$(tput setaf 8)%}"
RESET="%{$(tput sgr0)%}"

precmd() {
    local EXIT="$?"
    PS1=""
    if [ $EXIT != 0 ]; then
        PS1+="${RED}${EXIT} ${RESET}"
    fi
    PS1+="${BLUE}%1d${RESET}"
    BRANCH=`git rev-parse --abbrev-ref HEAD 2>/dev/null`
    if [ $? -eq 0 ]; then
        PS1+=" ${GREEN}${BRANCH}${RESET}"
    fi
    PS1+=" ${GRAY}%(!.#.\$)${RESET} "
}

setopt HIST_IGNORE_ALL_DUPS
