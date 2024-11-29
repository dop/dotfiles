#!/bin/sh

# Initialize frontend monorepo with .env.local files with my preferred
# configuration.

find . -type d -name node_modules -prune -o -name .env -print |
    while read ENV; do
        echo Creating ${ENV}.local ...
        echo TRUSTED_CERTIFICATE=false >> ${ENV}.local
        echo PROGRESS_BAR=false >> ${ENV}.local
    done
