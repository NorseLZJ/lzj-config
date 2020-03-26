#1/bin/bash

if [[ -z `tmux ls | grep open:` ]]
then
  tmux new -s open -d
  tmux rename-window -t zsh srv

  tmux split-window 
  tmux split-window -h 
  tmux select-pane -t 1
  tmux split-window  -h 

  tmux send-keys -t "open:1.1" './install-loginserver.sh' C-m
  tmux send-keys -t "open:1.2" './install-gameserver.sh' C-m
  tmux send-keys -t "open:1.3" './install-centerserver.sh' C-m
  tmux send-keys -t "open:1.4" './install-adminserver.sh' C-m

  tmux send-keys -t "open:1.1" './run-loginserver.sh' C-m
  tmux send-keys -t "open:1.2" './run-gameserver.sh' C-m
  tmux send-keys -t "open:1.3" './run-centerserver.sh' C-m
  tmux send-keys -t "open:1.4" './run-adminserver.sh' C-m

  tmux new-window -n oth
  tmux select-window -t oth
  tmux split-window -h  
  #tmux split-window
  #tmux select-pane -t 1 
  #tmux split-window

  tmux attach -t open
else
  tmux attach -t open
fi
