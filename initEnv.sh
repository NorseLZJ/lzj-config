#!/bin/bash

tagdir="./Env/"

workdir=$(
    cd $(dirname $0)
    pwd
)

cmd="apt-get"

if [[ -f /usr/bin/yum ]]; then
    cmd="yum"
fi

function cp_zsh() {
    if [ $UID == 1000 ]; then
        echo 'normal user by:' $(whoami)
        sudo ${cmd} install zsh -y
    fi
    if [ $UID == 0 ]; then
        echo 'super user by:' $(whoami)
        ${cmd} install zsh -y
    fi
    (sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)")

    if [ $? == 0 ]; then
        local dir=${workdir}"/zsh/"
        cp ${dir}zshrc ${tagdir}.zshrc
        echo " 记得.zshrc 里边的第一行 目录"
    fi
}

function cp_tmux() {
    local dir=${workdir}"/tmux/"
    cp ${dir}tmux.conf ${tagdir}.tmux.conf
    cp ${dir}session_name.sh ${tagdir}tmux.sh
}

function cp_vim() {
    # install vim-plug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # cp vimrc
    local dir=${workdir}"/vim/"
    cp ${dir}cp_vimrc.sh ${tagdir}.vimrc
}

cp_zsh
cp_tmux
cp_vim
