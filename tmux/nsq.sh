#1/bin/bash

if [[ -z `tmux ls | grep nsq:` ]]
then 
    tmux new -s nsq -d 
    tmux split-window -h -t "nsq:1"
    tmux send-keys -t "nsq:1.1" '/root/ws/wget/nsq-1.2.0.linux-amd64.go1.12.9/bin/nsqlookupd' C-m
    tmux send-keys -t "nsq:1.2" '/root/ws/wget/nsq-1.2.0.linux-amd64.go1.12.9/bin/nsqd --lookupd-tcp-address=127.0.0.1:4160 --broadcast-address=127.0.0.1' C-m
    tmux attach -t nsq 
else 
    tmux attach -t nsq 
fi
