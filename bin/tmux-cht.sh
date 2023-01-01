#!/usr/bin/env bash

languages=$(echo "golang c cpp javascript typescript nodejs nextjs rust cargo elixir" | tr " " "\n")
core_utils=$(echo "find xargs sed awk tar" | tr " " "\n")
selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "Query: " query

if echo "$languages" | grep -qs $selected; then
    tmux split-window -p 100 -h bash -c "curl cht.sh/$selected/`echo "$query" | tr " " "+"` & while [ : ]; do sleep 1; done"
else
    tmux split-window -p 100 -h bash -c "curl cht.sh/$selected~$query | less & while [ : ]; do sleep 1; done"
fi
