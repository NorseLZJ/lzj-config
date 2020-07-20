#!/bin/bash

# example
# tmux send-keys -t "open:1.4" './run-adminserver.sh' C-m

tmux_open() {
	if [ -z $(tmux ls | grep open:) ]; then
		tmux new -s open -d
		tmux rename-window -t zsh srv
		tmux split-window -h

		tmux new-window -n oth
		tmux select-window -t oth
		tmux split-window -h

		tmux attach -t open
	else
		tmux attach -t open
	fi
}

tmux_eth() {
	if [ -z $(tmux ls | grep eth:) ]; then
		tmux new -s eth -d
		tmux rename-window -t zsh srv
		tmux split-window

		tmux new-window -n oth
		tmux select-window -t oth
		tmux split-window

		tmux attach -t eth
	else
		tmux attach -t eth
	fi
}

tmux_code() {
	if [ -z $(tmux ls | grep code:) ]; then
		tmux new -s code -d
		tmux rename-window -t zsh srv
		tmux split-window

		tmux new-window -n oth
		tmux select-window -t oth
		tmux split-window -h

		tmux attach -t code
	else
		tmux attach -t code
	fi
}

tmux_doc() {
	if [[ -z $(tmux ls | grep doc:) ]]; then
		tmux new -s doc -d
		tmux rename-window -t zsh doc1
		tmux split-window -h
		tmux select-pane -t 1
		tmux send-keys 'godoc -http=192.168.20.171:16000 -goroot=$GOROOT' C-m
		tmux select-pane -t 2
		tmux send-keys 'pydoc3 -n 192.168.20.171 -p 16001' C-m
		tmux attach -t doc
	else
		tmux attach -t doc
	fi

}
param=$1

case ${param} in
"open")
	tmux_open
	;;
"eth")
	tmux_eth
	;;
"code")
	tmux_code
	;;
"doc")
	tmux_doc
	;;
*)
	echo "no option"
	;;
esac
