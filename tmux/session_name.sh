#!/bin/bash
name=$1
tmux_open() {
	if [ -z $(tmux ls | grep {name}:) ]; then
		tmux new -s ${name} -d
		tmux rename-window -t ${name} srv
		tmux split-window -h

		tmux new-window -n oth
		tmux select-window -t oth
		tmux split-window -h

		#tmux send-keys -t "open:1.2" 'htop' C-m
		tmux select-window -t srv

		tmux attach -t ${name}
	else
		tmux attach -t ${name}
	fi
}
tmux_open