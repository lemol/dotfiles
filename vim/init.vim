if &compatible
  set nocompatible
endif

if has("win32") || has("win16")
  set runtimepath+=~/AppData/Local/nvim/plugins/repos/github.com/Shougo/dein.vim
  call dein#begin(expand('~/AppData/Local/nvim/plugins'))
else
  set runtimepath+=~/.config/nvim/plugins/repos/github.com/Shougo/dein.vim
  call dein#begin(expand('~/.config/nvim/plugins'))
endif

call dein#add('Shougo/dein.vim')

" [[[[ PLUGINS INSTALATION

" {{{ FUNDAMENTAL
call dein#add('haya14busa/dein-command.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('neomake/neomake')
call dein#add('Shougo/vimshell')
call dein#add('Shougo/vimproc.vim')
call dein#add('mhinz/vim-startify')
call dein#add('tpope/vim-sensible')
" }}}

" {{{ STRUCTURE
call dein#add('scrooloose/nerdtree',
      \{'on_cmd': 'NERDTreeToggle'})
call dein#add('majutsushi/tagbar')
call dein#add('vimlab/split-term.vim')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
if empty($TMUX)==0
  call dein#add('edkolev/tmuxline.vim')
endif
" }}}

" {{{ NAVIGATION
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('Shougo/unite.vim')
call dein#add('vim-scripts/mru.vim')
call dein#add('jlanzarotta/bufexplorer')
call dein#add('junegunn/fzf')
call dein#add('junegunn/fzf.vim')
call dein#add('junegunn/vim-peekaboo')
" }}}

" {{{ EDITING
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('sheerun/vim-polyglot')
call dein#add('scrooloose/nerdcommenter')
call dein#add('Raimondi/delimitMate')
call dein#add('godlygeek/tabular')
call dein#add('junegunn/vim-easy-align')
call dein#add('easymotion/vim-easymotion')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('tpope/vim-unimpaired')
call dein#add('ervandew/supertab')
call dein#add('Yggdroot/indentLine')
call dein#add('Valloric/MatchTagAlways')
call dein#add('tpope/vim-surround')
call dein#add('wellle/targets.vim')
call dein#add('tpope/vim-repeat')
call dein#add('junegunn/rainbow_parentheses.vim')
call dein#add('mbbill/undotree')
call dein#add('AndrewRadev/splitjoin.vim')
" }}}

" {{{ HTML/JS/NODEJS/REACTJS
call dein#add('moll/vim-node')
call dein#add('neovim/node-host', { 'do': 'npm install --cache-min Infinity --loglevel http' })
call dein#add('othree/yajs.vim')
call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')
call dein#add('mustache/vim-mustache-handlebars')
call dein#add('mattn/emmet-vim')
call dein#add('othree/javascript-libraries-syntax.vim')
call dein#add('othree/es.next.syntax.vim')
call dein#add('tpope/vim-ragtag')
call dein#add('othree/html5.vim')
" }}}

" {{{ DISPLAY
call dein#add('junegunn/goyo.vim')
call dein#add('junegunn/limelight.vim')
call dein#add('amix/vim-zenroom2')
call dein#add('vim-scripts/ZoomWin')
call dein#add('zhaocai/GoldenView.Vim')
call dein#add('ryanoasis/vim-devicons')
" }}}

" {{{ GIT
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('renyard/vim-git-flow-format')
call dein#add('mhinz/vim-signify')
call dein#add('jaxbot/github-issues.vim')
call dein#add('junegunn/gv.vim')
" }}}

" {{{ PANDOC
call dein#add('vim-pandoc/vim-pandoc')
call dein#add('vim-pandoc/vim-pandoc-syntax')
" }}}

" {{{ THEMES
call dein#add('freeo/vim-kalisi')
call dein#add('bcicen/vim-vice')
call dein#add('mhartington/oceanic-next')
"call dein#add('altercation/vim-colors-solarized')
"call dein#add('frankier/neovim-colors-solarized-truecolor-only')
" }}}

call dein#end()

" ]]]]

" [[[[ CONFIGS
"
filetype plugin indent on
syntax enable
set encoding=utf8

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#format = 'Git_flow_branch_format'
let g:airline_powerline_fonts = 1

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

if (has("termguicolors"))
  set termguicolors
endif

" {{{ fundamental
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
let mapleader=","
augroup vimrc
  autocmd!
augroup END

set nu
set autoindent
set smartindent
set lazyredraw
set laststatus=2
set showcmd
set visualbell
set backspace=indent,eol,start
set timeoutlen=500
set whichwrap=b,s
set shortmess=aIT
set hlsearch " CTRL-L / CTRL-R W
set incsearch
set hidden
set ignorecase smartcase
set wildmenu
set wildmode=full
set tabstop=2
set shiftwidth=2
set expandtab smarttab
set scrolloff=5
set encoding=utf-8
set list
set listchars=tab:\|\ ,
set virtualedit=block
set nojoinspaces
set diffopt=filler,vertical
set autoread
set clipboard=unnamed
set foldlevelstart=99
set grepformat=%f:%l:%c:%m,%f:%l:%m
set completeopt=menuone,preview
set nocursorline
set nrformats=hex
silent! set cryptmethod=blowfish2

set pastetoggle=<F9>
set modelines=2
set synmaxcol=1000

silent! set ttymouse=xterm2
set mouse=a

" 80 chars/line
set textwidth=0
if exists('&colorcolumn')
  set colorcolumn=80
endif

" Keep the cursor on the same column
set nostartofline
if exists('&fixeol')
  set nofixeol
endif

" }}}

" {{{ files
if has("win32") || has("win16")
  set wildignore+=*\tmp\*,*.so,*.swp,*.zip,*\node_modules\*
else
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
endif
" }}}

" {{{ theme
set background=dark
set t_Co=256
colorscheme OceanicNext
"colorscheme kalisi
"colorscheme vice
if has('gui_running')
  set guifont=Menlo:h14 columns=80 lines=40
endif
" }}}

" {{{ plugins

let g:deoplete#enable_at_startup = 1

autocmd! BufWritePost * Neomake
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" }}}

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

" {{{ distraction free
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" }}}

" ]]]]

" [[[[ MAPPINGS

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" fullscreen
if has("win32") || has("win16")
  map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif

map <leader>z :Goyo<CR>

vnoremap < <gv 						" Reselect after indent/outdent
vnoremap > >gv

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Motions

nnoremap gg           ggzv
nnoremap G            Gzv

nnoremap [q           :cprevious<cr>
nnoremap ]q           :cnext<cr>
nnoremap [Q           :cfirst<cr>
nnoremap ]Q           :clast<cr>

nnoremap [l           :lprevious<cr>
nnoremap ]l           :lnext<cr>
nnoremap [L           :lfirst<cr>
nnoremap ]L           :llast<cr>

nnoremap [b           :bprevious<cr>
nnoremap ]b           :bnext<cr>
nnoremap [B           :bfirst<cr>
nnoremap ]B           :blast<cr>

nnoremap [t           :tabprevious<cr>
nnoremap ]t           :tabnext<cr>
nnoremap [T           :tabfirst<cr>
nnoremap ]T           :tablast<cr>

" ----------------------------------------------------------------------------
" Moving lines
" ----------------------------------------------------------------------------
nnoremap <silent> <C-k> :move-2<cr>
nnoremap <silent> <C-j> :move+<cr>
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-k> :move-2<cr>gv
xnoremap <silent> <C-j> :move'>+<cr>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
xnoremap < <gv
xnoremap > >gv
" ]]]]
