"if &compatible
"  set nocompatible
"endif

"if has("win32") || has("win16")
"  set runtimepath+=~/AppData/Local/nvim/plugins/repos/github.com/Shougo/dein.vim
"  call dein#begin(expand('~/AppData/Local/nvim/plugins'))
"else
"  set runtimepath+=~/.config/nvim/plugins/repos/github.com/Shougo/dein.vim
"  call dein#begin(expand('~/.config/nvim/plugins'))
"endif

"call dein#add('Shougo/dein.vim')

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
call dein#add('maksimr/vim-jsbeautify') " See README
call dein#add('bentayloruk/vim-react-es6-snippets')
call dein#add('benjie/neomake-local-eslint.vim')
" }}}

" {{{ ELM
" npm install -g elm
" npm install -g elm-test
" npm install -g elm-oracle
call dein#add('elmcast/elm-vim')
" }}}

" {{{ C#/DOTNET
call dein#add('OrangeT/vim-csharp')
call dein#add('OmniSharp/omnisharp-vim')
" }}}

" {{{ DISPLAY
call dein#add('junegunn/goyo.vim')
call dein#add('junegunn/limelight.vim')
call dein#add('amix/vim-zenroom2')
call dein#add('vim-scripts/ZoomWin')
call dein#add('zhaocai/GoldenView.Vim')
call dein#add('ryanoasis/vim-devicons')
call dein#add('vim-scripts/ScrollColors')
"if has("gui_running")
  call dein#add('equalsraf/neovim-gui-shim')
"endif
" }}}

" {{{ GIT
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('renyard/vim-git-flow-format')
call dein#add('mhinz/vim-signify')
call dein#add('jaxbot/github-issues.vim')
call dein#add('junegunn/gv.vim')
call dein#add('int3/vim-extradite')
call dein#add('vim-scripts/gitignore')
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

let g:goldenview__enable_at_startup = 1
let g:goldenview__enable_default_mapping = 1

" javascript again {{{

"let g:javascript_conceal_function       = "ƒ"
"let g:javascript_conceal_null           = "ø"
"let g:javascript_conceal_this           = "@"
"let g:javascript_conceal_return         = "⇚"
"let g:javascript_conceal_undefined      = "¿"
"let g:javascript_conceal_NaN            = "ℕ"
"let g:javascript_conceal_prototype      = "¶"
"let g:javascript_conceal_static         = "•"
"let g:javascript_conceal_super          = "Ω"
"let g:javascript_conceal_arrow_function = "⇒"

" }}}

"let g:neomake_javascript_enabled_makers = ['eslint']

hi clear Conceal

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
set showmatch
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
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set virtualedit=block
set nojoinspaces
set diffopt=filler,vertical
set autoread
set clipboard=unnamed
set foldmethod=indent
set foldnestmax=5
set foldlevelstart=99
set foldcolumn=0
set grepformat=%f:%l:%c:%m,%f:%l:%m
set completeopt=menuone,preview
set nocursorline
set nrformats=hex
silent! set cryptmethod=blowfish2
" Use Unix as the standard file type
set ffs=unix,dos,mac

set pastetoggle=<F9>
set modelines=2
set synmaxcol=1000

silent! set ttymouse=xterm2
set mouse=a

" Use pleasant but very visible search hilighting
hi Search ctermfg=white ctermbg=173 cterm=none guifg=#ffffff guibg=#e5786d gui=none
hi! link Visual Search
hi clear Conceal

augroup vimrcFold
  " fold vimrc itself by categories
  autocmd!
  autocmd FileType vim set foldmethod=marker
  autocmd FileType vim set foldlevel=0
augroup END

augroup sourcing
  autocmd!
  autocmd bufwritepost .vimrc source $MYVIMRC
augroup END

" 80 chars/line
set textwidth=0
if exists('&colorcolumn')
  "set colorcolumn=100
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
"if has('gui_running')
  "set guifont=Meslo:h16 lines=40
  "set guioptions-=T
  "set guioptions-=e
  "set guitablabel=%M\ %t
  "if has("gui_gtk2")
    "set guifont=Inconsolata-dz\ for\ Powerline\ 12
  "elseif has("gui_macvim")
    "set guifont=Menlo\ Regular:h14
  "elseif has("gui_win32")
    "set guifont=Consolas:h11:cANSI
  "endif
"endif


"https://gist.github.com/kevinis/c788f85a654b2d7581d8
"URxvt*font:                 xft:Monaco for Powerline:regular:size=8
"URxvt*imFont:               xft:Monaco for Powerline:regular:size=8
"URxvt*boldFont:             xft:Monaco for Powerline:bold:size=8
"URxvt*italicFont:           xft:Monaco for Powerline:italic:size=8
"URxvt*boldItalicFont:       xft:Monaco for Powerline:bold:italic:size=8
hi IncSearch gui=italic guifg=#303030 guibg=#cd8b60
"URxvt*font: xft:DroidSansMonoForPowerline Nerd Font:pixelsize=15:antialias=true:hinting=true xft:Hack:size=10:Hack:size=10:Terminess Powerline:style=regular
" }}}

" {{{ plugins

let g:deoplete#enable_at_startup = 1

"autocmd! BufWritePost * Neomake
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

" Return to last edit position when opening files (You want this!)
augroup last_edit
  autocmd!
  autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif
augroup END

" Remember info about open buffers on close
set viminfo^=%
" {{{ distraction free
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" }}}

" beautify
autocmd FileType javascript noremap  <buffer> <leader>x :call JsBeautify()<cr>
autocmd FileType json noremap        <buffer> <leader>x :call JsonBeautify()<cr>
autocmd FileType jsx noremap         <buffer> <leader>x :call JsxBeautify()<cr>
autocmd FileType html noremap        <buffer> <leader>x :call HtmlBeautify()<cr>
autocmd FileType css noremap         <buffer> <leader>x :call CSSBeautify()<cr>
autocmd FileType javascript vnoremap <buffer> <leader>x :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap       <buffer> <leader>x :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap        <buffer> <leader>x :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap       <buffer> <leader>x :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap        <buffer> <leader>x :call RangeCSSBeautify()<cr>

nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

" ]]]]

" [[[[ MAPPINGS

noremap ,, ,

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" fullscreen
if has("win32") || has("win16")
  map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif

map <leader>z :Goyo<CR>

vnoremap < <gv 						" Reselect after indent/outdent
vnoremap > >gv

nnoremap <C-left> <C-w>h
nnoremap <C-down> <C-w>j
nnoremap <C-up> <C-w>k
nnoremap <C-right> <C-w>l

" Open window splits in various places
nmap <leader>sh :leftabove  vnew<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>

" previous buffer, next buffer
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bn :bn<cr>

" close every window in current tabview but the current
nnoremap <leader>bo <c-w>o

" delete buffer without closing pane
noremap <leader>bd :Bd<cr>

" previous buffer, next buffer
nnoremap <leader>tp :tabprevious<cr>
nnoremap <leader>tn :tabnext<cr>
nnoremap <leader>to :tabnew<cr>

" delete buffer without closing pane
noremap <leader>bd :Bd<cr>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" fuzzy find buffers
noremap <leader>b<space> :CtrlPBuffer<cr>
" Motions

" Stop Align plugin from forcing its mappings on us
let g:loaded_AlignMapsPlugin=1
" Align on equal signs
map <Leader>a= :Align =<CR>
" Align on commas
map <Leader>a, :Align ,<CR>
" Align on pipes
map <Leader>a<bar> :Align <bar><CR>
" Prompt for align character
map <leader>ap :Align

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! ToggleFindNerd()
  if IsNERDTreeOpen()
    exec ':NERDTreeToggle'
  else
    exec ':NERDTreeFind'
  endif
endfunction

" If nerd tree is closed, find current file, if open, close it
nmap <silent> <leader>f <ESC>:call ToggleFindNerd()<CR>
nmap <silent> <leader>F <ESC>:NERDTreeToggle<CR>

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

" Copy and paste to os clipboard
nmap <leader>y "*y
vmap <leader>y "*y
nmap <leader>d "*d
vmap <leader>d "*d
nmap <leader>p "*p
vmap <leader>p "*p

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

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

let g:extradite_width = 60
" Hide messy Ggrep output and copen automatically
function! NonintrusiveGitGrep(term)
  execute "copen"
  " Map 't' to open selected item in new tab
  execute "nnoremap <silent> <buffer> t <C-W><CR><C-W>T"
  execute "silent! Ggrep " . a:term
  execute "redraw!"
endfunction

command! -nargs=1 GGrep call NonintrusiveGitGrep(<q-args>)
nmap <leader>gs :Gstatus<CR>
nmap <leader>gg :copen<CR>:GGrep 
nmap <leader>gl :Extradite!<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gb :Gblame<CR>

function! CommittedFiles()
  " Clear quickfix list
  let qf_list = []
  " Find files committed in HEAD
  let git_output = system("git diff-tree --no-commit-id --name-only -r HEAD\n")
  for committed_file in split(git_output, "\n")
    let qf_item = {'filename': committed_file}
    call add(qf_list, qf_item)
  endfor
  " Fill quickfix list with them
  call setqflist(qf_list, '')
endfunction

" Show list of last-committed files
nnoremap <silent> <leader>g? :call CommittedFiles()<CR>:copen<CR>

nmap <silent> <leader><cr> :noh\|hi Cursor guibg=red<cr>

" Use buffer words as default tab completion
let g:SuperTabDefaultCompletionType = '<c-x><c-p>'

" But provide (neco-ghc) omnicompletion
if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif
" ]]]]
