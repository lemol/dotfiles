" curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
" sh ./installer.sh ~/.cache/dein

if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " UI
  call dein#add('mhinz/vim-startify')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('wsdjeg/dein-ui.vim')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('majutsushi/tagbar')

  if empty($TMUX)==0
    call dein#add('edkolev/tmuxline.vim')
  endif

  " THEMES
  call dein#add('morhetz/gruvbox')
  call dein#add('mhartington/oceanic-next')
  "call dein#add('hardcoreplayers/oceanic-material')


  " GIT
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rhubarb')

  " NAVIGATION
  "call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('liuchengxu/vim-clap')
  call dein#add('vn-ki/coc-clap')

  " LANGUAGE
  call dein#add('neoclide/coc.nvim', {'rev': 'release'})
  call dein#add('vim-test/vim-test')
  call dein#add('sheerun/vim-polyglot')

  " CODE
  call dein#add('preservim/nerdcommenter')
  call dein#add('Raimondi/delimitMate')
  call dein#add('godlygeek/tabular')
  call dein#add('junegunn/vim-peekaboo')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('Valloric/MatchTagAlways')
  call dein#add('tpope/vim-surround')
  call dein#add('svermeulen/vim-subversive')
  call dein#add('wellle/targets.vim')
  call dein#add('tpope/vim-repeat')
  call dein#add('junegunn/rainbow_parentheses.vim')
  call dein#add('mbbill/undotree')

  " ELM
  " npm install -g @elm-tooling/elm-language-server
  call dein#add('andys8/vim-elm-syntax')
  call dein#add('antoine-atmire/vim-elmc')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
set background=dark
colorscheme OceanicNext
set encoding=UTF-8

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" { BASE

let mapleader=","
set tabstop=2
set foldmethod=manual
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/elm-stuff/*

" }

" { UI

nmap <silent> <leader>f <ESC>:NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['^node_modules$']

if (has("termguicolors"))
 set termguicolors
endif

let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" }

" { NAVIGATION

" CtrlP
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_working_path_mode = 'ra'


nmap <c-p> :Clap files<CR>
nmap <c-s-p> :Clap buffers<CR>
nmap <c-o> :Clap coc_outline<CR>

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
nnoremap <leader><tab> :tabnext<cr>

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/*', '*.pyc', 'node_modules/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/', '*.png', 'elm-stuff/'])

"nmap <C-p> :Denite -start-filter file/rec<CR>
"nmap <C-o> :Denite buffer<CR>
"nnoremap \ :Denite grep<CR>


" Tabularize
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
  inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
endif

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Subversive

nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)
nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)
nmap <leader>ss <plug>(SubversiveSubstituteWordRange)

" }


" { COC
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" }

function! _blockcomment()
" [[[[ PLUGINS INSTALATION

" {{{ FUNDAMENTAL
"call dein#add('haya14busa/dein-command.vim')
"call dein#add('Shougo/neocomplete.vim')
"call dein#add('Shougo/deoplete.nvim')
"call dein#add('vim-syntastic/syntastic')
"call dein#add('neomake/neomake')
"call dein#add('Shougo/vimshell')
"call dein#add('Shougo/vimproc.vim')
"call dein#add('mhinz/vim-startify')
"call dein#add('tpope/vim-sensible')
"call dein#add('autozimu/LanguageClient-neovim', {
"    \ 'rev': 'next',
"    \ 'build': 'bash install.sh',
"    \ })
" }}}

" {{{ STRUCTURE
"call dein#add('scrooloose/nerdtree',
"      \{'on_cmd': 'NERDTreeToggle'})
"call dein#add('majutsushi/tagbar')
"call dein#add('vimlab/split-term.vim')
"call dein#add('vim-airline/vim-airline')
"call dein#add('vim-airline/vim-airline-themes')
"if empty($TMUX)==0
"  call dein#add('edkolev/tmuxline.vim')
"endif
" }}}

" {{{ NAVIGATION
"call dein#add('ctrlpvim/ctrlp.vim')
"call dein#add('Shougo/unite.vim')
"call dein#add('vim-scripts/mru.vim')
"call dein#add('jlanzarotta/bufexplorer')
"call dein#add('junegunn/fzf')
"call dein#add('junegunn/fzf.vim')
"call dein#add('junegunn/vim-peekaboo')
" }}}

" {{{ EDITING
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
"call dein#add('sheerun/vim-polyglot')
"call dein#add('scrooloose/nerdcommenter')
"call dein#add('Raimondi/delimitMate')
"call dein#add('godlygeek/tabular')
"call dein#add('junegunn/vim-easy-align')
"call dein#add('easymotion/vim-easymotion')
"call dein#add('terryma/vim-multiple-cursors')
"call dein#add('bronson/vim-trailing-whitespace')
"call dein#add('tpope/vim-unimpaired')
"call dein#add('ervandew/supertab')
"call dein#add('Yggdroot/indentLine')
"call dein#add('Valloric/MatchTagAlways')
"call dein#add('tpope/vim-surround')
"call dein#add('wellle/targets.vim')
"call dein#add('tpope/vim-repeat')
"call dein#add('junegunn/rainbow_parentheses.vim')
"call dein#add('mbbill/undotree')
"call dein#add('AndrewRadev/splitjoin.vim')
" }}}

" {{{ HTML/JS/NODEJS/REACTJS
"call dein#add('moll/vim-node')
"call dein#add('neovim/node-host', { 'do': 'npm install --cache-min Infinity --loglevel http' })

"call dein#add('othree/html5.vim')
"call dein#add('mattn/emmet-vim')

"call dein#add('pangloss/vim-javascript')
"call dein#add('mxw/vim-jsx')
"call dein#add('benjie/neomake-local-eslint.vim')

"call dein#add('mustache/vim-mustache-handlebars')

"call dein#add('flowtype/vim-flow')
"call dein#add('sbdchd/neoformat')
"call dein#add('prettier/vim-prettier')
"call dein#add('skywind3000/asyncrun.vim')
"call dein#add('w0rp/ale')
"call dein#add('styled-components/vim-styled-components')

"call dein#add('othree/yajs.vim')
"call dein#add('othree/es.next.syntax.vim')
"call dein#add('othree/javascript-libraries-syntax.vim')
"call dein#add('maksimr/vim-jsbeautify') " See README
"call dein#add('bentayloruk/vim-react-es6-snippets')
" }}}

" {{{ ELM
" npm install -g elm
" npm install -g elm-test
" npm install -g elm-oracle
"call dein#add('elmcast/elm-vim')
" }}}

" {{{ C#/DOTNET
"call dein#add('OrangeT/vim-csharp')
"call dein#add('OmniSharp/omnisharp-vim')
"call dein#add('tpope/vim-dispatch')
"call dein#add('vim-scripts/dbext.vim')
" }}}

" {{{ DISPLAY
"call dein#add('junegunn/goyo.vim')
"call dein#add('junegunn/limelight.vim')
"call dein#add('amix/vim-zenroom2')
"call dein#add('vim-scripts/ZoomWin')
"call dein#add('zhaocai/GoldenView.Vim')
"call dein#add('ryanoasis/vim-devicons')
"call dein#add('vim-scripts/ScrollColors')
"call dein#add('Yggdroot/indentLine')
"if has("gui_running")
"  call dein#add('equalsraf/neovim-gui-shim')
"endif
" }}}

" {{{ GIT
"call dein#add('tpope/vim-fugitive')
"call dein#add('airblade/vim-gitgutter')
"call dein#add('Xuyuanp/nerdtree-git-plugin')
"call dein#add('renyard/vim-git-flow-format')
"call dein#add('mhinz/vim-signify')
"call dein#add('jaxbot/github-issues.vim')
"call dein#add('junegunn/gv.vim')
"call dein#add('int3/vim-extradite')
"call dein#add('vim-scripts/gitignore')
" }}}

" {{{ PANDOC
"call dein#add('vim-pandoc/vim-pandoc')
"call dein#add('vim-pandoc/vim-pandoc-syntax')
" }}}

" {{{ THEMES
"call dein#add('freeo/vim-kalisi')
"call dein#add('bcicen/vim-vice')
"call dein#add('mhartington/oceanic-next')
"call dein#add('ayu-theme/ayu-vim')
"call dein#add('altercation/vim-colors-solarized')
"call dein#add('frankier/neovim-colors-solarized-truecolor-only')
" }}}

"call dein#end()

" ]]]]

" [[[[ CONFIGS
"
"filetype plugin indent on
"syntax enable
"set encoding=utf8

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#format = 'Git_flow_branch_format'
let g:airline_powerline_fonts = 1

let g:goldenview__enable_at_startup = 1
let g:goldenview__enable_default_mapping = 1

" javascript again {{{

let g:javascript_plugin_flow = 1

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

"let g:neoformat_try_formatprg = 1
"let g:neoformat_run_all_formatters = 1
"augroup NeoformatAutoFormat
    "autocmd!
    "autocmd FileType javascript setlocal formatprg=prettier\
                                             "\--stdin\
                                             "\--print-width\ 80\
                                             "\--single-quote\
                                             "\--trailing-comma\ es5
    "autocmd BufWritePre *.js Neoformat
"augroup END

"let g:prettier#autoformat = 0
"let g:prettier#config#parser = 'babylon'
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

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
set completeopt=longest,menuone,preview
set previewheight=5
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
"colorscheme OceanicNext
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

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

"let b:SuperTabDisabled = 0
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_loadSettings = 0

let g:LanguageClient_serverCommands = {
    \ 'cs': ['tcp://127.0.0.1:2000'],
    \ }

let g:LanguageClient_rootMarkers = {
    \ 'cs': ['.git', '*.csproj'],
    \ }

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-x><C-o>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction "}}}

"autocmd! BufWritePost * Neomake
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" }}}

" [[[ syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cs_checkers = ['code_checker']
" ]]]

" [[[ dotnet
let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_prefer_global_sln = 1
let g:OmniSharp_server_path = '~/.local/opt/omnisharp-http/start-server'
" ]]]

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
nnoremap <leader><tab> :tabnext<cr>

" delete buffer without closing pane
noremap <leader>bd :Bd<cr>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" fuzzy find buffers
noremap <leader>b<space> :CtrlPBuffer<cr>
noremap <C-O> :CtrlPBuffer<cr>
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
"let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

" But provide (neco-ghc) omnicompletion
"if has("gui_running")
  "imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
"else " no gui
  "if has("unix")
    "inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  "endif
"endif
" ]]]]

" [[[ omnisharp
augroup omnisharp_commands
    autocmd!

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <buffer> <F5> :wa!<CR>:OmniSharpBuild<CR>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <buffer> <Leader>b :wa!<CR>:OmniSharpBuildAsync<CR>
    " Automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    " Cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <buffer> <Leader>x  :OmniSharpFixIssue<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Many
    nnoremap <Leader>rr :OmniSharpRename<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <Leader>rl :OmniSharpReloadSolution<CR>
nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
" Load the current .cs file to the nearest project
nnoremap <Leader>tp :OmniSharpAddToProject<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Add syntax highlighting for types and interfaces
nnoremap <Leader>th :OmniSharpHighlightTypes<CR>

let g:OmniSharp_selector_ui = 'unite'  " Use unite.vim
"let g:OmniSharp_selector_ui = 'ctrlp'  " Use ctrlp.vim
"let g:OmniSharp_selector_ui = 'fzf'    " Use fzf.vim
"let g:OmniSharp_selector_ui = ''       " Use vim - command line, quickfix etc.

" Enable snippet completion
" let g:OmniSharp_want_snippet=1
" ]]]

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" nnoremap <silent> <Leader><Leader> :Files<CR>
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>l        :Lines<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>`        :Marks<CR>

nnoremap <silent> <Leader>p        :FZF<CR>
" nnoremap <silent> q: :History:<CR>
" nnoremap <silent> q/ :History/<CR>



" {{{ FLOWLANG
let g:flow#autoclose = 1
let g:flow#enable = 1
let g:flow#flowpath = "npm run flow"
" }}}

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
endfunction
