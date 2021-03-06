#!/bin/bash

TRACKED_FILES_INPUT=".trackedItems"
BACKUPS_DIR="$DEV_HOME/backer-upper/backups/"

while read -r item
do
    if [[ ! -z $item ]]
        item="${item/#\~/$HOME}"
    then
        if [[ -f $item ]]; then
            echo "backing up file: $item"
            cp $item $BACKUPS_DIR
        elif [[ -d $item ]]; then
            echo "backing up directory: $item"
            cp -R $item $BACKUPS_DIR
        fi
    fi
done < "$TRACKED_FILES_INPUT"
