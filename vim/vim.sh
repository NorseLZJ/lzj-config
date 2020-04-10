#!/bin/bash

if [ "$1" = 'vim' ]; 
then
    echo "to My Vim" 
    mv .vim .vim.space 
    mv .vim.old .vim
    mv .vimrc.old .vimrc
elif [ "$1" = 'space' ]
then
    mv .vim .vim.old
    mv .vimrc .vimrc.old
    mv .vim.space .vim
    echo "to spaceVim" 
else
    echo "please check your choise!"
fi
