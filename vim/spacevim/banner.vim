"=============================================================================
" banner.vim --- SpaceVim core#banner layer
" Copyright (c) 2016-2019 Wang Shidong & Contributors
" Author: Wang Shidong < wsdjeg at 163.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================

scriptencoding utf-8
function! SpaceVim#layers#core#banner#config() abort
  let g:_spacevim_welcome_banners = [
        \ [
        \ '',
        \ ' version : ' . g:spacevim_version . '   by : spacevim.org',
        \ '',
        \ ],
        \ [
        \ '',
        \ ' version : ' . g:spacevim_version . '   by : spacevim.org',
        \ '',
        \ ],
        \ ]
endfunction

" vim:set et sw=2:
