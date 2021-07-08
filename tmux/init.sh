#!/bin/bash

echo "init tmux.conf"
cat >"~/.tmux.conf" <<EOF
#C-b is not acceptable -- Vim uses it
set-option -g prefix C-w

set-window-option -g mode-keys vi
set-window-option -g utf8 on

# set window split
bind-key v split-window -h
bind-key b split-window

# Start numbering at 1
set -g base-index 1
setw -g mode-keys vi

set -g renumber-windows on
set -g pane-base-index 1

bind-key k select-pane -U
bind-key j select-pane -D
bind-key h select-pane -L
bind-key l select-pane -R
EOF

echo "init tmux.sh"

cat >"~/tmux.sh" <<EOF
#!/bin/bash
name=$1
tmux_open() {
	if [ -z  ]; then
		tmux new -s  -d
		tmux rename-window -t  srv

        # if want to split vertical window
    	#tmux split-window -h

		tmux new-window -n oth
		tmux select-window -t oth

		# run command example
        #tmux send-keys -t "open:1.2" 'htop' C-m
		tmux select-window -t srv

		tmux attach -t 
	else
		tmux attach -t  
	fi
}
tmux_open
EOF
