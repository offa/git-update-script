#!/bin/bash

USH_CNT=0
USH_RAND=$RANDOM$RANDOM

shopt -s nullglob

function git_update()
{
    if [ -d "$1/.git/" ]
    then
        echo "fetching $1"
        cd $1; git fetch --all --prune
        cd -
    else
        echo "skipping $1 - .git/ not found"
    fi
}

for dir in *; do
    (
        if [ -d "${dir}"  ]
        then
            git_update ${dir} > $USH_RAND$USH_CNT.txt 2>&1
        fi
    ) &
    if [ -d "${dir}" ]; then
        ((USH_CNT++))
    fi
done

wait

for ((i=0; i<$USH_CNT;i++)); do
    cat $USH_RAND$i.txt 
    rm $USH_RAND$i.txt
done
