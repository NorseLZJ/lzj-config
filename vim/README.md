# vimrc
一个简单的vimrc 配置，里面有一个插件是vim-go，
如果你不做go语言开发可以干掉相关的插件及配置，
别的大概都是通用的，自动补全，目录树，等

使用前可以先装以下vim-plug插件管理器
因为这个vimrc 文件是用这个管理的，

leader 改成你自己熟悉的如果没有自己的习惯可以
暂时使用这个试试看，

vim colorscheme 配置文件 https://github.com/flazz/vim-colorschemes
git 下来 在自己的 ~/.vim 下面创建 colors 把所有clone 的colors 下的移动进去就可以选择了

#### cp_vimrc
    比较轻量，少了一个补全插件 
    "Plug 'valloric/youcompleteme'  co_vimrc 只是注释掉了
    最主要的是这个，别的你根据自己的需求去改变

#### _vsvim
使用 visual studio 做开发时 安装 vsVim 插件

cp _vsvim /c/Users/yourUserName/.vimrc

拷贝_vsvim 到你的用户目录,改名为 .vimrc  