#!/bin/bash

ORIG_PWD=$PWD


shopt -s nullglob

function git_update()
{
    if [ -d "$1/.git/" ]
    then
        echo -e "\e[1;32m =====> $1 \e[0m"
        cd $1
        git fetch --all --prune
        cd ${ORIG_PWD}
    else
        echo "skipping $1 - .git/ not found"
    fi
}

for dir in `ls`
do
    if [ -d "${dir}"  ]
    then
        git_update ${dir}
    fi
done

wait

