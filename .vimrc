" Deorder: Custom VIM config "

syntax on

set nobomb

filetype off
filetype plugin indent on

let g:c_no_curly_error = 1

" Controls "{{{
set mouse=a
"}}}

" Encoding "{{{
set ff=unix
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8
"}}}

" Coloring "{{{
set t_Co=256
set background=dark
"}}}

" Clipboard "{{{
set clipboard=autoselectplus
"}}}

" Completion "{{{
set completeopt-=preview
set complete-=i " Exclude files in completion
"}}}

" Searching "{{{
set nohlsearch " Disable highlight search results
set noincsearch " Disable search while typing
"}}}

" Indenting "{{{
set tabstop=2
set shiftround
set shiftwidth=2
set softtabstop=2
set autoindent " Enable auto indenting
set backspace=2 " Make backspace work like expected
set nosmartindent " Disable smart indenting
"set noexpandtab " Use tabs instead of spaces
set expandtab " Use spaces instead of tabs
"}}}

" Folding "{{{
set foldignore= " Enable folding for everything
set foldmethod=marker " Use marker to show collapsed code
set foldlevelstart=99 " Open all folds by default
"}}}

" Wrapping "{{{
set nowrap " Disable soft line breaking
set linebreak " Line breaking at specific characters
set textwidth=0 " Disable hard line breaking
set wrapmargin=0 " Disable hard line breaking
"}}}

" Interface "{{{
set ruler
set ttyfast
set modeline
set lazyredraw
set fillchars+=vert:\
set nonumber " Disable line numbering
set hidden " Allow modified buffers to be hidden
set title " Set filename in window title
"set laststatus=2 " Always show status
set showcmd " Show command at bottom
set wildmenu " Enable commandline completion
set wildmode=longest:full,full
set wildignore+=*/tmp/*.*.so,*.a,*.pyc,.build.*,.git
set noshowmatch " Disable jumping to matching brackets
"}}}

if &compatible | set nocompatible | endif

" Plugins "{{{
call plug#begin()

" Local Vim "{{{
Plug 'embear/vim-localvimrc'
let g:localvimrc_ask = 0
"}}}

" ALE "{{{
Plug 'w0rp/ale'
let g:ale_enabled = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '>>'
"let b:ale_linters = ['eslint', 'clangtidy']
"}}}

" Editor Config "{{{
Plug 'editorconfig/editorconfig-vim'
"}}}

" Indent Guides "{{{
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 0 
let g:indent_guides_enable_on_vim_startup = 1
"}}}

" Syntax Color "{{{

" HTML "{{{
"Plug 'othree/html5.vim'
"}}}

" CSS "{{{
"Plug 'ap/vim-css-color'
"Plug 'JulesWang/css.vim'
"Plug 'hail2u/vim-css3-syntax'
"}}}

" JSON "{{{
"Plug 'elzr/vim-json'
"let g:vim_json_syntax_conceal = 0
"}}}

" PHP "{{{
"Plug 'StanAngeloff/php.vim', {'for': 'php'}
"}}}

"}}}
call plug#end()
"}}}

" Jump to last position when reopening a file except for commit messages "{{{
autocmd BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
"}}}

" Disable automatically adding comment prefix "{{{
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"}}}

" Custom statusbar "{{{

" Disabled for now
"set laststatus=2 

set statusline=%f
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},
set statusline+=%{&ff}]
set statusline+=%y
set statusline+=%h
set statusline+=[%{getbufvar(bufnr('%'),'&mod')?'modified':'saved'}]      
set statusline+=%r
set statusline+=\ %=
set statusline+=Line:%l/%L\ [%p%%]
set statusline+=\ Col:%c
set statusline+=\ Buf:%n
set statusline+=\ [%b][0x%B]

"highlight StatusLine ctermfg=236 ctermbg=white

"}}}

" Custom colors "{{{
highlight GitGutterChangeDelete ctermfg=darkyellow ctermbg=234
highlight GitGutterChange ctermfg=darkyellow ctermbg=234
highlight GitGutterDelete ctermfg=darkred ctermbg=234
highlight GitGutterAdd ctermfg=darkgreen ctermbg=234
highlight ALEWarning term=reverse cterm=reverse
highlight ALEError term=reverse cterm=reverse
highlight Visual term=reverse cterm=reverse
highlight Normal guibg=NONE ctermbg=NONE
highlight IndentGuidesEven ctermbg=234
highlight IndentGuidesOdd ctermbg=NONE
highlight SignColumn ctermbg=236
"}}}

" Reselect visual block after indent/outdent "{{{
vnoremap < <gv
vnoremap > >gv
"}}}

" Custom extension filetype "{{{
autocmd BufRead,BufNewFile *.h set filetype=c
"}}}

" Set undo files "{{{
if has('persistent_undo')
"silent !mkdir ~/.vim/undo > /dev/null 2>&1
set undodir=~/.vim/undo/
set undoreload=3000
set undolevels=300
set undofile
endif
"}}}

" Set swap files "{{{
"silent !mkdir ~/.vim/swap > /dev/null 2>&1
set backupdir=~/.vim/swap/
set directory=~/.vim/swap/
"}}}

" Vimdiff "{{{
if &diff
set diffopt=filler,foldcolumn:0
endif
"}}}

" Set shell to bash "{{{
set shell=/bin/bash
"}}}

" Set split config "{{{
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
set splitbelow
set splitright
"}}}

let g:mapleader = "\<Space>"
