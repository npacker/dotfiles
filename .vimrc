" VUNDLE SETUP
" =============================================================================
filetype off
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim

" PLUGINS
" =============================================================================
call vundle#begin()

" Vundle
Plugin 'gmarik/Vundle.vim'

" Use <Tab> for autocompletion 
Plugin 'ervandew/supertab'

" Add, delete, and change parenthesis and brackets
Plugin 'tpope/vim-surround'

" Wrapper for Git on Vim commandline
Plugin 'tpope/vim-fugitive'

" Edit several things at once with multiple cursors
Plugin 'erryma/vim-multiple-cursors'

" Puppet syntax support
Plugin 'puppetlabs/puppet-syntax-vim'

" Sass syntax support
Plugin 'cakebaker/scss-syntax.vim'

" JavaScript syntax improved
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'

" PHP syntax improved
Plugin 'StanAngeloff/php.vim'

" Solarized color scheme
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

" SYNTAX
" =============================================================================
syntax on
filetype detect
filetype plugin on
filetype indent on

" FORMATTING
" =============================================================================
" Convert tabs to spaces
set expandtab
" Tabs are equal to 2 columns
set tabstop=2
" Reindent operations use 2 columns per tab
set shiftwidth=2
" Number of columns per tab in insert mode
set softtabstop=2
" Allow backspace to remove indentation, end-of-line, and insert positions
set backspace=indent,eol,start
" Auto indentation
set autoindent
" Disable visual text wrap
set nowrap

" APPEARANCE
" =============================================================================
" Tell vim that the background is dark
set background=dark
" Solarized color scheme
colorscheme solarized

" UI
" =============================================================================
" Line numbers
set number
" Always show command bar
set showcmd
" Highlight the currnet line
set cursorline
" Always show status line
set laststatus=2
" Disable the fold column to the left of line numbers
set foldcolumn=0
" Highlight matching braces
set showmatch
" Disable audible bell
set noerrorbells
" Disable visual bell
set novisualbell
" Defer redraws for improved performance
set lazyredraw
" Autocomplete options
set completeopt=longest,menu,preview

" STATUSLINE
" =============================================================================
" Filename tail
set statusline=%t
" Filetype
set statusline+=\ %y
" Separator
set statusline+=%=      
" Column number
set statusline+=%c
" Line number
set statusline+=\ %l
" Total lines
set statusline+=/%L
" Percentage of file
set statusline+=\ %P

" SEARCH
" =============================================================================
" Incremental search, highlight for each character typed
set incsearch
" Highlight all matches
set hlsearch

" ENCODING 
" =============================================================================
" Default character encoding
set encoding=utf8
" Possible end of line formats
set fileformats=unix,mac,dos

" BACKUP
" =============================================================================
" Disable annoying backup/swap files
set nobackup
set nowritebackup
set noswapfile

" MAPPINGS
" =============================================================================
" Auto insert semicolons at the end of the line
inoremap ; <C-o>A;<Esc>

" CONFIGURATION
" =============================================================================
let g:SuperTabDefaultCompletionType='<C-x><C-o>'
