import os

vimrc = """
"base
set nocompatible                " Enables us Vim specific features
filetype plugin indent on       " ... and enable filetype detection
set ttyfast                     " Indicate fast terminal conn for faster redraw
set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set autoindent                  " Enabile Autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set number                      " Show line numbers
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline                " Do not highlight cursor (speeds up highlighting)
set lazyredraw                  " Wait to redraw
"colorscheme darcula 			"colorscheme
set mouse=""
set cursorline
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set ts=4
set expandtab
set autoindent 
set splitright
"""
ss = """
#!/bin/bash

name=$1

tmux_open() {
        if [ -z $(tmux ls | grep name) ]; then
                tmux new -s $name -d
                tmux rename-window -t $name srv
                #tmux split-window -h

                tmux new-window -n oth
                tmux select-window -t oth
                #tmux split-window -h

                #tmux send-keys -t "open:1.2" 'htop' C-m
                tmux select-window -t srv

                tmux attach -t $name
        else
                tmux attach -t $name
        fi
}

tmux_open
"""

tmux_conf = """
set-option -g prefix C-w
set-option -g mouse off

set-window-option -g mode-keys vi
#set-window-option -g utf8 on

# set window split
bind-key v split-window -h
bind-key b split-window

# Start numbering at 1
set -g base-index 1
setw -g mode-keys vi

set -g renumber-windows   on
set -g pane-base-index 1

bind-key k select-pane -U
bind-key j select-pane -D
bind-key h select-pane -L
bind-key l select-pane -R
"""

bashrc = """
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'
alias tmuxconf='$EDITOR $ZSH_TMUX_CONFIG'

alias svnup='svn up --username=liuzijian --password=liuzijian123 '

export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin:/home/aa/go/bin
export PROTOBUF=/usr/local/protobuf
export VISUAL=vim
"""

if __name__ == "__main__":
    mm = {
        ".vimrc": [vimrc, "w"],
        ".tmux.conf": [tmux_conf, "w"],
        "ss": [ss, "w"],
        ".bashrc": [bashrc, "a"],
    }
    for file, content in mm.items():
        with open(file, content[1]) as f:
            f.write(content[0])
    os.chmod("ss", os.X_OK)
