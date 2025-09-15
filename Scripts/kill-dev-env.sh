#!/bin/bash

tmux has-session -t Development

if [ $? != 0 ]; then
    notify-send -i terminal --hint=int:transient:1 "No Session Found" "The TMUX session 'Development' was not active."
    exit 0
else
    notify-send -i terminal --hint=int:transient:1 "Session closed" "The TMUX 'Development' session was closed."
fi

tmux kill-session -t Development
