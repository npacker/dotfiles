" VUNDLsetEset SETUP
" =============================================================================
filetype off
set nocompatible

if has("win32")
  set rtp+=~/vimfiles/bundle/Vundle.vim/
  let path='~/vimfiles/bundle'
  call vundle#begin(path)
else
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
endif

" PLUGINS
" =============================================================================
" Vundle
Plugin 'gmarik/Vundle.vim'

" Use the the . operator with plugin commands
Plugin 'tpope/vim-repeat'

" Wrapper for Git on Vim commandline
Plugin 'tpope/vim-fugitive'

" Add, change, and delete delimiters
Plugin 'tpope/vim-surround'

" Edit several things at once with multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" Expand the current visual selection
Plugin 'terryma/vim-expand-region'

" Vastly enhanced movement controls
Plugin 'Lokaltog/vim-easymotion'

" Use <Tab> for autocompletion
Plugin 'ervandew/supertab'

" Puppet syntax support
Plugin 'puppetlabs/puppet-syntax-vim'

" HTML5 syntax support
Plugin 'othree/html5.vim'

" Sass syntax support
Plugin 'cakebaker/scss-syntax.vim'

" CSS3 syntax support
Plugin 'JulesWang/css.vim'

" JavaScript syntax improved
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'

" PHP syntax improved
Plugin 'StanAngeloff/php.vim'
Plugin 'shawncplus/phpcomplete.vim'

" Racket syntax support
Plugin 'wlangstroth/vim-racket'

" Extra syntax
Plugin 'justinmk/vim-syntax-extra'

" Solarized color scheme
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

" CONFIG
" =============================================================================

" SuperTab
" --------
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<C-P>'
let g:SuperTabLongestHighlight = 1
let g:SuperTabLongestEnhanced = 1

" Vim Multiple Cursors
" --------------------
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_normal_maps = {
      \ 'd':1,
      \ 'c':1,
      \ }

" Vim Expand Region
" -----------------
let g:expand_region_text_objects = {
      \ 'i]':1,
      \ 'ib':1,
      \ 'iB':1,
      \ 'it':1,
      \ 'at':1,
      \ }

" Vim EasyMotion
" --------------
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_startofline = 0
map <Leader> <Plug>(easymotion-prefix)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" SYNTAX
" =============================================================================
syntax on
filetype plugin indent on

" ENCODING
" =============================================================================
" Default character encoding
set encoding=utf-8
" Default file encoding
set fileencoding=utf-8
" File encoding hints
set fileencodings=utf-8,latin1,usc-bom
" Possible end of line formats
set fileformats=unix,mac,dos

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

" EDITING
" =============================================================================
" Map <Leader> to <SPACE>
map <SPACE> <Leader>
" Hide buffers instead of close them, allowing switching before saving
set hidden
" Set reasonable timout
set timeoutlen=2000
" Eliminate timeout when pressing <Esc>
set ttimeoutlen=0

" APPEARANCE
" =============================================================================
" Tell vim that the background is dark
set background=dark
" Solarized color scheme
try
  colorscheme solarized
catch
  colorscheme default
endtry

" UI
" =============================================================================
" Remove splash text
set shortmess+=I
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
" Display at least one line between cursor and horizontal window borders
set scrolloff=1
" Display unwanted characters
set list
set listchars=tab:›\ ,trail:·,nbsp:+
" Turn on wildmenu
set wildmenu
" Activate wildmenu with <TAB>
set wildchar=<TAB>
" Show wildmenu list
set wildmode=full
" Open new splits to the right
set splitright
" Open new splits below
set splitbelow

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
" Assume global search by default
set gdefault
" Use <C-L> to clear last search hilight
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
" Use <C-P> for fuzzy file search
nnoremap <C-P> :e<SPACE>**/
" Use <C-K> for buffer search
nnoremap <C-K> :b<SPACE>
" Use very magic regular expressions for search and replace
cnoremap %s/ %smagic/

" PERFORMANCE
" =============================================================================
" Defer redraws for improved performance; with ttyfast, this buffers output
set lazyredraw
" Increase number of characters sent to terminal at once
set ttyfast

" BACKUP
" =============================================================================
" Disable annoying backup/swap files
set nobackup
set nowritebackup
set noswapfile
