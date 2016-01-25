#!/bin/bash


shopt -s nullglob

echo -e "\e[1;31m Start fetching all Git projects in '${PWD}' \e[0m\n"

function git_update()
{
    if [ -d "$1/.git/" ]
    then
        cd $1;
        OUTPUT="$(git fetch --all --prune)"
        echo -e "\e[1;32m =====> $1 \e[0m\n${OUTPUT}\n"
        cd $OLDPWD
    else
        echo -e "skipping $1 - .git/ not found\n"
    fi
}

for dir in *; do
    (
    if [ -d "${dir}"  ]
    then
        git_update ${dir}
    fi
    ) &
done

wait
