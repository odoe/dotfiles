#!/usr/bin/bash

languages=$(echo "golang c cpp javascript typescript rust elixir" | tr " " "\n")
core_utils=$(echo "find xargs sed awk" | tr " " "\n")
selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "QUERY: " query

if echo "$languages" | grep -qs $selected; then
    tmux split-window -h bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less"
else
    tmux split-window -h bash -c "cht.sh/$selected~$query | less"
fi
