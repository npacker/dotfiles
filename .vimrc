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

" CSS3 syntax support
Plugin 'JulesWang/css.vim'

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
" Always show edit mode
set showmode
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
" Autocomplete, match longest substring, always show menu, show details
set completeopt=longest,menu,preview
" Display diff filler lines, always vertical split
set diffopt=filler,vertical

" PERFORMANCE
" =============================================================================
" Defer redraws for improved performance; with ttyfast, this buffers output
set lazyredraw
" Increase number of characters sent to terminal at once
set ttyfast

" STATUSLINE
" =============================================================================
" Filename tail
set statusline=%t
" Filetype
set statusline+=\ %y
" Buffer number
set statusline+=\ #%n
" Separator
set statusline+=%=      
" Modified
set statusline+=%3m
" Line number
set statusline+=\ %3l:
" Column number
set statusline+=%c
" Percentage of file
set statusline+=\ %P
" Total lines
set statusline+=\ (%L)

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
