if &compatible
  set nocompatible
endif
set runtimepath+=~/AppData/Local/nvim/plugins/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/AppData/Local/nvim/plugins'))

call dein#add('Shougo/dein')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('tpope/vim-sensible')

call dein#add('Shougo/vimproc.vim')

call dein#add('scrooloose/nerdtree',
      \{'on_cmd': 'NERDTreeToggle'})

call dein#add('mhinz/vim-startify')

" {{{ WEB DEV

call dein#add('mattn/emmet-vim')
"call dein#add('vimlab/neojs')
call dein#add('tpope/vim-sensible')
call dein#add('honza/vim-snippets')
call dein#add('vimlab/split-term.vim')
call dein#add('moll/vim-node')
call dein#add('othree/yajs.vim')
call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')
call dein#add('mustache/vim-mustache-handlebars')
call dein#add('neovim/node-host', { 'do': 'npm install --cache-min Infinity --loglevel http' })
call dein#add('othree/javascript-libraries-syntax.vim')
call dein#add('othree/es.next.syntax.vim')

call dein#add('sheerun/vim-polyglot')

call dein#add('kien/ctrlp.vim')
call dein#add('Shougo/unite.vim')
call dein#add('junegunn/goyo.vim')
call dein#add('junegunn/limelight.vim')
call dein#add('scrooloose/nerdcommenter')
call dein#add('Raimondi/delimitMate')
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')
call dein#add('vim-scripts/mru.vim')
call dein#add('amix/vim-zenroom2')
call dein#add('vim-pandoc/vim-pandoc')
call dein#add('vim-pandoc/vim-pandoc-syntax')

call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('godlygeek/tabular')
call dein#add('majutsushi/tagbar')
call dein#add('easymotion/vim-easymotion')
call dein#add('flazz/vim-colorschemes')
call dein#add('freeo/vim-kalisi')
call dein#add('tpope/vim-unimpaired')
call dein#add('ervandew/supertab')
call dein#add('vim-scripts/ZoomWin')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('zhaocai/GoldenView.Vim')





" }}}

" {{{ STYLES

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
"call dein#add('altercation/vim-colors-solarized')
"call dein#add('frankier/neovim-colors-solarized-truecolor-only')
call dein#add('bcicen/vim-vice')

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
colorscheme vice
"colorscheme kalisi

let g:airline#extensions#tabline#enabled = 1

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

"" Mappings

let mapleader=","
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

map <leader>z :Goyo<CR>
