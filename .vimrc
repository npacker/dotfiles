set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" PLUGINS "
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

" SYNTAX "
syntax on
filetype detect
filetype plugin on
filetype indent on

" INDENTING AND WHITESPACE "
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

" UI STATUS "
set number
set laststatus=2

" SEARCH "
set showmatch
set hlsearch

" ENCODING "
set encoding=utf8
set ffs=unix,mac,dos

" BACKUP "
set nobackup
set nowb
set noswapfile
