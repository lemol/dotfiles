if &compatible
  set nocompatible
endif
set runtimepath+=~/AppData/Local/nvim/plugins/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/AppData/Local/nvim/plugins'))

"call dein#add('Shougo/dein')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/deoplete.nvim')

call dein#add('Shougo/vimproc.vim', {
    \ 'build': {
    \     'windows': 'tools\\update-dll-mingw',
    \     'cygwin': 'make -f make_cygwin.mak',
    \     'mac': 'make -f make_mac.mak',
    \     'linux': 'make',
    \     'unix': 'gmake',
    \    },
    \ })

call dein#add('scrooloose/nerdtree',
      \{'on_cmd': 'NERDTreeToggle'})

call dein#add('mhinz/vim-startify')

" {{{ WEB DEV

call dein#add('mattn/emmet-vim')
call dein#add('vimlab/neojs')

" }}}

" {{{ STYLES

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
#call dein#add('altercation/vim-colors-solarized')
call dein#add('frankier/neovim-colors-solarized-truecolor-only')

" }}}
"
call dein#end()

filetype plugin indent on
syntax enable

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set background=dark
"let g:solarized_termcolors=16
"let g:solarized_termtrans = 1
"let g:solarized_termcolors=256
"let g:solarized_italic=0
colorscheme solarized

let g:airline#extensions#tabline#enabled = 1

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
