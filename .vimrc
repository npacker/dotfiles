" VUNDLE "
filetype off
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim

" PLUGINS "
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'

call vundle#end()

" SYNTAX "
syntax on
filetype detect
filetype plugin on
filetype indent on

" FORMATTING "
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=eol,start,indent
set expandtab
set nowrap

" APPEARANCE "
set background=dark
colorscheme solarized

" UI "
set number
set showcmd
set cursorline
set laststatus=2
set foldcolumn=0
set noerrorbells
set novisualbell
set lazyredraw

" SEARCH "
set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch

" ENCODING "
set encoding=utf8
set ffs=unix,mac,dos

" BACKUP "
set nobackup
set nowb
set noswapfile
