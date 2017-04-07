#!/bin/bash


shopt -s nullglob

echo -e "\e[1;31m Start fetching all Git projects in '${PWD}' \e[0m\n"

function git_update()
{
    echo -e "\n\e[1;32m =====> $1 \e[0m"

    if [ -d "$1/.git/" ]
    then
        cd $1;
        git fetch --all --prune
        cd $OLDPWD
    else
        echo -e "skipping $1 - .git/ not found"
    fi
}

for dir in *; do
    if [ -d "${dir}"  ]
    then
        git_update ${dir}
    fi
done

wait
