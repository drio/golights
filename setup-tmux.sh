#!/bin/bash

SESSION=go-lights

N=$(tmux ls | grep $SESSION | wc -l)

if [ $N -eq 0 ]
then
	tmux new-session -d -s $SESSION -x "$(tput cols)" -y "$(tput lines)"

  tmux split-window -v

  tmux select-pane -t 1
  tmux send-keys "vim -S Session.vim" C-m

  tmux select-pane -t 2
  tmux split-window -h

  tmux send-keys "echo two" C-m
  tmux select-pane -t 2
else
	echo "Session $SESSION already exists"
fi

tmux attach-session -t $SESSION
