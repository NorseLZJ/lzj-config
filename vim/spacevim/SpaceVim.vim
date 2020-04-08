scriptencoding utf-8
let g:spacevim_version = '1.5.0-dev'
lockvar g:spacevim_version
let g:spacevim_default_indent          = 2
let g:spacevim_expand_tab              = 1
let g:spacevim_relativenumber          = 1
let g:spacevim_enable_bepo_layout  = 0
let g:spacevim_max_column              = 120
let g:spacevim_home_files_number        = 6
let g:spacevim_enable_guicolors = 0
let g:spacevim_enable_googlesuggest    = 0
let g:spacevim_windows_leader          = 's'
let g:spacevim_enable_insert_leader    = 1
let g:spacevim_data_dir
      \ = $XDG_CACHE_HOME != ''
      \   ? $XDG_CACHE_HOME . SpaceVim#api#import('file').separator
      \   : expand($HOME. join(['', '.cache', ''],
      \     SpaceVim#api#import('file').separator))
let g:spacevim_plugin_bundle_dir
      \ = g:spacevim_data_dir . join(['vimfiles', ''],
      \ SpaceVim#api#import('file').separator)
let g:spacevim_realtime_leader_guide   = 1
let g:spacevim_enable_key_frequency = 0
if (has('python3') && SpaceVim#util#haspy3lib('neovim')) &&
      \ (has('nvim') || (has('patch-8.0.0027')))
  let g:spacevim_autocomplete_method = 'deoplete'
elseif has('lua')
  let g:spacevim_autocomplete_method = 'neocomplete'
elseif has('python') && ((has('job') && has('timers') && has('lambda')) || has('nvim'))
  let g:spacevim_autocomplete_method = 'completor'
elseif has('timers')
  let g:spacevim_autocomplete_method = 'asyncomplete'
else
  let g:spacevim_autocomplete_method = 'neocomplcache'
endif
let g:spacevim_enable_neomake          = 1
let g:spacevim_enable_ale          = 0
let g:spacevim_guifont                 = ''
let g:spacevim_enable_ycm              = 0
let g:spacevim_sidebar_width           = 30
let g:spacevim_snippet_engine = 'neosnippet'
let g:spacevim_enable_neocomplcache    = 0
let g:spacevim_enable_cursorline       = 1
let g:spacevim_statusline_separator = 'nil'
let g:spacevim_statusline_iseparator = 'nil'
let g:spacevim_enable_statusline_bfpath = 0
let g:spacevim_enable_statusline_tag = 1
let g:spacevim_statusline_left_sections = ['winnr', 'filename', 'major mode',
      \ 'search count',
      \ 'syntax checking', 'minor mode lighters',
      \ ]
let g:spacevim_statusline_right_sections = ['fileformat', 'cursorpos', 'percentage']
let g:spacevim_statusline_unicode_symbols = 1
let g:spacevim_enable_language_specific_leader = 1
let g:spacevim_enable_statusline_mode     = 0
let g:spacevim_custom_color_palette = []
let g:spacevim_enable_cursorcolumn     = 0
let g:spacevim_error_symbol            = '✖'
let g:spacevim_warning_symbol          = '⚠'
let g:spacevim_info_symbol             = SpaceVim#api#import('messletters').circled_letter('i')
let g:spacevim_terminal_cursor_shape = 2
let g:spacevim_vim_help_language       = 'en'
let g:spacevim_language                = ''
let g:spacevim_keep_server_alive = 1
let g:spacevim_colorscheme             = 'gruvbox'
let g:spacevim_colorscheme_bg             = 'dark'
let g:spacevim_colorscheme_default     = 'desert'
let g:spacevim_filemanager             = 'vimfiler'
let g:spacevim_filetree_direction             = 'left'
let g:spacevim_sidebar_direction        = ''
if has('patch-7.4.2071')
  let g:spacevim_plugin_manager          = 'dein'
else
  let g:spacevim_plugin_manager          = 'neobundle'
endif
let g:spacevim_plugin_manager_processes = 16
let g:spacevim_checkinstall            = 1
let g:spacevim_vimcompatible           = 0
let g:spacevim_enable_debug            = 0
let g:spacevim_auto_disable_touchpad   = 1
let g:spacevim_debug_level             = 1
let g:spacevim_hiddenfileinfo          = 1
let g:spacevim_gitcommit_pr_icon       = ''
let g:spacevim_gitcommit_issue_icon    = ''
let g:spacevim_buffer_index_type = 4
let g:spacevim_windows_index_type = 3
let g:spacevim_enable_tabline_ft_icon = 0
let g:spacevim_enable_os_fileformat_icon = 0
let g:spacevim_github_username         = ''
let g:spacevim_windows_smartclose      = 'q'
let g:spacevim_disabled_plugins        = []
let g:spacevim_custom_plugins          = []
let g:spacevim_filetype_icons           = {}
let g:spacevim_force_global_config     = 0
let g:spacevim_enable_powerline_fonts  = 1
let g:spacevim_lint_on_save            = 1
let g:spacevim_search_tools            = ['rg', 'ag', 'pt', 'ack', 'grep', 'findstr']
let g:spacevim_project_rooter_patterns = ['.git/', '_darcs/', '.hg/', '.bzr/', '.svn/']
let g:spacevim_project_rooter_automatically = 1
let g:spacevim_commandline_prompt = '➭'
let g:spacevim_todo_labels = map(['fixme', 'question', 'todo', 'idea'], '"@" . v:val')
let g:spacevim_lint_on_the_fly         = 0
let g:spacevim_update_retry_cnt          = 3
let g:spacevim_enable_vimfiler_welcome = 1
let g:spacevim_autocomplete_parens = 1
let g:spacevim_enable_vimfiler_gitstatus = 0
let g:spacevim_enable_vimfiler_filetypeicon = 0
let g:spacevim_smartcloseignorewin     = ['__Tagbar__' , 'vimfiler:default']
let g:spacevim_smartcloseignoreft      = [
      \ 'tagbar',
      \ 'vimfiler',
      \ 'defx',
      \ 'SpaceVimRunner',
      \ 'SpaceVimREPL',
      \ 'SpaceVimQuickFix',
      \ 'HelpDescribe',
      \ 'VebuggerShell',
      \ 'VebuggerTerminal',
      \ 'SpaceVimTabsManager'
      \ ]
let g:_spacevim_altmoveignoreft         = ['Tagbar' , 'vimfiler']
let g:spacevim_enable_javacomplete2_py = 0
let g:spacevim_src_root                = 'E:\sources\'
let g:spacevim_hosts_url
      \ = 'https://raw.githubusercontent.com/racaljk/hosts/master/hosts'
let g:spacevim_wildignore
      \ = '*/tmp/*,*.so,*.swp,*.zip,*.class,tags,*.jpg,
      \*.ttf,*.TTF,*.png,*/target/*,
      \.git,.svn,.hg,.DS_Store,*.svg'
let g:_spacevim_mappings = {}
let g:_spacevim_mappings_space_custom = []
let g:_spacevim_mappings_space_custom_group_name = []
let g:_spacevim_neobundle_installed     = 0
let g:_spacevim_dein_installed          = 0
let g:_spacevim_vim_plug_installed      = 0
if !exists('g:leaderGuide_vertical')
  let g:leaderGuide_vertical = 0
endif
let g:spacevim_leader_guide_vertical = 0
if !exists('g:leaderGuide_sort_horizontal')
  let g:leaderGuide_sort_horizontal = 0
endif
let g:spacevim_leader_guide_sort_horizontal = 0
if !exists('g:leaderGuide_position')
  let g:leaderGuide_position = 'botright'
endif
let g:spacevim_leader_guide_position = 'botright'
if !exists('g:leaderGuide_run_map_on_popup')
  let g:leaderGuide_run_map_on_popup = 1
endif
let g:spacevim_leader_guide_run_map_on_popup = 1
if !exists('g:leaderGuide_hspace')
  let g:leaderGuide_hspace = 5
endif
let g:spacevim_leader_guide_hspace = 5
if !exists('g:leaderGuide_flatten')
  let g:leaderGuide_flatten = 1
endif
let g:spacevim_leader_guide_flatten = 1
if !exists('g:leaderGuide_default_group_name')
  let g:leaderGuide_default_group_name = ''
endif
let g:spacevim_leader_guide_default_group_name = ''
if !exists('g:leaderGuide_max_size')
  let g:leaderGuide_max_size = 0
endif
let g:spacevim_leader_guide_max_size = 0
if !exists('g:leaderGuide_submode_mappings')
  let g:leaderGuide_submode_mappings =
        \ { '<C-C>': 'win_close', 'n': 'page_down', 'p': 'page_up', 'u' : 'undo'}
endif
let g:spacevim_leader_guide_submode_mappings = {'<C-C>': 'win_close'}
if !exists('g:LanguageClient_serverCommands')
  let g:LanguageClient_serverCommands = {}
endif
command -nargs=1 LeaderGuide call SpaceVim#mapping#guide#start_by_prefix('0', <args>)
command -range -nargs=1 LeaderGuideVisual call SpaceVim#mapping#guide#start_by_prefix('1', <args>)
function! SpaceVim#end() abort
  if !g:spacevim_vimcompatible
    call SpaceVim#mapping#def('nnoremap <silent>', '<Tab>', ':wincmd w<CR>', 'Switch to next window or tab','wincmd w')
    call SpaceVim#mapping#def('nnoremap <silent>', '<S-Tab>', ':wincmd p<CR>', 'Switch to previous window or tab','wincmd p')
  endif
  if g:spacevim_vimcompatible
    let g:spacevim_windows_leader = ''
    let g:spacevim_windows_smartclose = ''
  endif
  if !g:spacevim_vimcompatible
    nnoremap <silent><C-x> <C-w>x
    cnoremap <C-f> <Right>
    " Navigation in command line
    cnoremap <C-a> <Home>
    cnoremap <C-b> <Left>
    " @bug_vim with <silent> command line can not be cleared
    cnoremap <expr> <C-k> repeat('<Delete>', strchars(getcmdline()) - getcmdpos() + 1)
  endif
  call SpaceVim#server#connect()
  if g:spacevim_enable_neocomplcache
    let g:spacevim_autocomplete_method = 'neocomplcache'
  endif
  if g:spacevim_enable_ycm
    if has('python') || has('python3')
      let g:spacevim_autocomplete_method = 'ycm'
    else
      call SpaceVim#logger#warn('YCM need +python or +python3 support, force to using ' . g:spacevim_autocomplete_method)
    endif
  endif
  if g:spacevim_keep_server_alive
    call SpaceVim#server#export_server()
  endif
  if !empty(g:spacevim_windows_leader)
    call SpaceVim#mapping#leader#defindWindowsLeader(g:spacevim_windows_leader)
  endif
  call SpaceVim#mapping#g#init()
  call SpaceVim#mapping#z#init()
  call SpaceVim#mapping#leader#defindKEYs()
  call SpaceVim#mapping#space#init()
  if !SpaceVim#mapping#guide#has_configuration()
    let g:leaderGuide_map = {}
    call SpaceVim#mapping#guide#register_prefix_descriptions('', 'g:leaderGuide_map')
  endif
  if g:spacevim_vim_help_language ==# 'cn'
    let &helplang = 'cn'
  elseif g:spacevim_vim_help_language ==# 'ja'
    let &helplang = 'jp'
  endif
  ""
  " generate tags for SpaceVim
  let help = fnamemodify(g:_spacevim_root_dir, ':p:h') . '/doc'
  try
    exe 'helptags ' . help
  catch
    call SpaceVim#logger#warn('Failed to generate helptags for SpaceVim')
  endtry
  ""
  " set language
  if !empty(g:spacevim_language)
    silent exec 'lan ' . g:spacevim_language
  endif
  if SpaceVim#layers#isLoaded('core#statusline')
    call SpaceVim#layers#core#statusline#init()
  endif
  " tab options:
  set smarttab
  let &expandtab = g:spacevim_expand_tab
  let &tabstop = g:spacevim_default_indent
  let &softtabstop = g:spacevim_default_indent
  let &shiftwidth = g:spacevim_default_indent
  let g:unite_source_menu_menus =
        \ get(g:,'unite_source_menu_menus',{})
  let g:unite_source_menu_menus.CustomKeyMaps = {'description':
        \ 'Custom mapped keyboard shortcuts                   [unite]<SPACE>'}
  let g:unite_source_menu_menus.CustomKeyMaps.command_candidates =
        \ get(g:unite_source_menu_menus.CustomKeyMaps,'command_candidates', [])
  let g:unite_source_menu_menus.MyStarredrepos = {'description':
        \ 'All github repos starred by me                   <leader>ls'}
  let g:unite_source_menu_menus.MyStarredrepos.command_candidates =
        \ get(g:unite_source_menu_menus.MyStarredrepos,'command_candidates', [])
  let g:unite_source_menu_menus.MpvPlayer = {'description':
        \ 'Musics list                   <leader>lm'}
  let g:unite_source_menu_menus.MpvPlayer.command_candidates =
        \ get(g:unite_source_menu_menus.MpvPlayer,'command_candidates', [])
  if g:spacevim_realtime_leader_guide
    nnoremap <silent><nowait> <leader> :<c-u>LeaderGuide get(g:, 'mapleader', '\')<CR>
    vnoremap <silent> <leader> :<c-u>LeaderGuideVisual get(g:, 'mapleader', '\')<CR>
  endif
  let g:leaderGuide_max_size = 15
  call SpaceVim#plugins#load()
  call SpaceVim#plugins#projectmanager#RootchandgeCallback()
  call SpaceVim#util#loadConfig('general.vim')
  call SpaceVim#autocmds#init()
  if has('nvim')
    call SpaceVim#util#loadConfig('neovim.vim')
  endif
  call SpaceVim#util#loadConfig('commands.vim')
  filetype plugin indent on
  syntax on
endfunction
function! s:parser_argv() abort
  if !argc()
    return [0]
  elseif argv(0) =~# '/$'
    let f = fnamemodify(expand(argv(0)), ':p')
    if isdirectory(f)
      return [1, f]
    else
      return [1, getcwd()]
    endif
  elseif argv(0) ==# '.'
    return [1, getcwd()]
  elseif isdirectory(expand(argv(0)))
    return [1, fnamemodify(expand(argv(0)), ':p')]
  else
    return [2, argv()]
  endif
endfunction
function! SpaceVim#begin() abort
  call SpaceVim#util#loadConfig('functions.vim')
  call SpaceVim#util#loadConfig('init.vim')
  " Before loading SpaceVim, We need to parser argvs.
  let s:status = s:parser_argv()
  " If do not start Vim with filename, Define autocmd for opening welcome page
  if s:status[0] == 0
    let g:_spacevim_enter_dir = fnamemodify(getcwd(), ':~')
    call SpaceVim#logger#info('Startup with no argv, current dir is used: ' . g:_spacevim_enter_dir )
    augroup SPwelcome
      au!
      autocmd VimEnter * call SpaceVim#welcome()
    augroup END
  elseif s:status[0] == 1
    let g:_spacevim_enter_dir = fnamemodify(s:status[1], ':~')
    call SpaceVim#logger#info('Startup with directory: ' . g:_spacevim_enter_dir  )
    augroup SPwelcome
      au!
      autocmd VimEnter * call SpaceVim#welcome()
    augroup END
  else
    call SpaceVim#logger#info('Startup with argv: ' . string(s:status[1]) )
  endif
  call SpaceVim#default#options()
  call SpaceVim#default#layers()
  call SpaceVim#default#keyBindings()
  call SpaceVim#commands#load()
endfunction
function! SpaceVim#welcome() abort
  call SpaceVim#logger#info('try to open SpaceVim welcome page')
  if get(g:, '_spacevim_session_loaded', 0) == 1
    call SpaceVim#logger#info('start SpaceVim with session file, skip welcome page')
    return
  endif
  exe 'cd' fnameescape(g:_spacevim_enter_dir)
  if exists('g:_spacevim_checking_flag') && g:_spacevim_checking_flag
    return
  endif
  if exists(':Startify') == 2
    Startify
    if isdirectory(bufname(1))
      bwipeout! 1
    endif
  endif
  if g:spacevim_enable_vimfiler_welcome
        \ && get(g:, '_spacevim_checking_flag', 0) == 0
    if exists(':VimFiler') == 2
      VimFiler
      wincmd p
    elseif exists(':Defx') == 2
      Defx
      wincmd p
    endif
  endif
endfunction
