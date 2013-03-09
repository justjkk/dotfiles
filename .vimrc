" -------
" General
" -------
syntax on
filetype on
set nocompatible
set history=1000
set cf
set ffs=unix,dos,mac
set isk+=_,$,@,%,#,-
set viminfo='1000,f1,:100,@100,/20
set modeline
set autoread
set tabpagemax=50
set title
set mouse=a

set fillchars=fold:.

set background=dark
colorscheme koehler

" ---------
" Highlight
" ---------
highlight Comment ctermfg=LightGrey guifg=#444444 cterm=bold
highlight StatusLineNC ctermfg=Black ctermbg=DarkGrey cterm=bold
highlight StatusLine ctermbg=Black ctermfg=LightGrey
highlight OverLength ctermfg=DarkRed guibg=#592929
highlight Normal ctermbg=none
highlight LineNr ctermbg=DarkGrey
highlight Folded ctermbg=none ctermfg=DarkGreen
match OverLength /\%81v.\+/

" -----------------------------
" Highlight Trailing Whitespace
" -----------------------------
set list listchars=trail:.,tab:>.
highlight SpecialKey ctermfg=DarkGray ctermbg=Black

" -------
" Backups
" -------
set nobackup
set nowritebackup
set noswapfile
set backupdir=$HOME/.vim/backup
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/swap,~/tmp,.

" --
" UI
" --
set ruler
set showcmd
set nolazyredraw
set number
set wildmenu
set wildmode=list:longest,full
set ch=2
set backspace=2
set whichwrap+=<,>,h,l,[,]
set shortmess=filtIoOA
set report=0
set nostartofline

" -----------
" Visual Cues
" -----------
set showmatch
set mat=3
set incsearch
set laststatus=2
set ignorecase
set smartcase
set hlsearch

" ---------------
" Text Formatting
" ---------------
set autoindent
set smartindent
set wrap
set softtabstop=2
set shiftwidth=2
set tabstop=4
set expandtab
set nosmarttab
set formatoptions+=n
set textwidth=80
set virtualedit=block

" ----------
" File Types
" ----------
filetype on
filetype plugin on
filetype plugin indent on

set guioptions-=T
set foldmethod=syntax

autocmd BufRead *.twig set ft=htmltwig
autocmd BufRead,BufNewFile *.py set foldmethod=indent ts=4 sts=4 sw=4
autocmd BufRead,BufNewFile *.php set foldmethod=indent ts=4 sts=4 sw=4 binary expandtab
autocmd BufRead * silent! %s/[\r \t]\+$//
autocmd BufEnter * :%s/[ \t\r]\+$//e

imap jj <esc>

let NERDTreeIgnore = ['\.py[co]$']

set path=$PWD/**
set wildignorecase
map <C-F> <Esc>:find<Space>
