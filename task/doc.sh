#!/bin/bash

if [[ -z `tmux ls | grep doc:` ]]
then
  tmux new -s doc -d
  tmux rename-window -t zsh doc1 
  tmux split-window -h

  tmux select-pane -t 1 
  tmux send-keys 'godoc -http=localhost:6060 -goroot=$GOROOT' C-m
  tmux select-pane -t 2 
  tmux send-keys 'pydoc -p 6061' C-m

  tmux attach -t doc
else
  tmux attach -t doc
fi

