#1/bin/bash

if [[ -z `tmux ls | grep wd:` ]]
then 
    tmux new -s wd -d 
    tmux split-window -h -t "wd:1"
    #tmux split-window -h -t "wd:2"
    tmux attach -t wd 
else 
    tmux attach -t wd 
fi
