#1/bin/bash

if [[ -z `tmux ls | grep srv:` ]]
then
  tmux new -s srv -d
  tmux split-window -t "srv:1"
  tmux split-window -h -t "srv:1"
  tmux select-pane -t 0
  tmux split-window  -h -t "srv:1"

  tmux send-keys -t "srv:1.0" './run-loginserver.sh' C-m
  tmux send-keys -t "srv:1.1" './run-gameserver.sh' C-m
  tmux send-keys -t "srv:1.2" './run-centerserver.sh' C-m
  tmux send-keys -t "srv:1.3" './run-adminserver.sh' C-m

  tmux attach -t srv
else
  tmux attach -t srv
fi
