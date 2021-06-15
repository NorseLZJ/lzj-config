#!/bin/bash

tagdir="./Env/"

workdir=$(
    cd $(dirname $0)
    pwd
)

cp $workdir"/tmux.conf" ~/.tmux.conf
cp $workdir"/session_name.sh" ~/tmux.sh
chmod +x ~/tmux.sh
