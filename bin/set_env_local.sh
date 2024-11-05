#!/bin/sh

# Initialize frontend monorope with .env.local files with my preferred
# configuration.

ENVS=$(find . -type d -name node_modules -prune -o -name .env -print)

echo $ENVS | while read -d ' ' ENV; do
    echo Creating ${ENV}.local ...
    echo TRUSED_CERTIFICATE=false >> ${ENV}.local
    echo PROGRESS_BAR=false >> ${ENV}.local
done
