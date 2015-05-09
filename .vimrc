" VUNDLE SETUP
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

" Emmet HTML editing
Plugin 'mattn/emmet-vim'

" Use <Tab> for autocompletion
Plugin 'ervandew/supertab'

" Execute external command
Plugin 'Shougo/vimproc.vim'

" Crazy unified search interface
Plugin 'Shougo/unite.vim'

" Puppet syntax support
Plugin 'puppetlabs/puppet-syntax-vim'

" HTML5 syntax support
Plugin 'othree/html5.vim'

" Sass syntax support
Plugin 'cakebaker/scss-syntax.vim'

" CSS3 syntax support
Plugin 'JulesWang/css.vim'

Plugin 'npacker/vim-css3complete'

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

" Unite
" -----
" We'll set the statusline ourselves
let g:unite_force_overwrite_statusline = 0
" Cache as few as 10 files
let g:unite_source_rec_min_cache_files = 10
" Cache up to 100,000 files
let g:unite_source_rec_max_cache_files = 100000

" Set options for all unite buffers
" Prompt, prompt always visible, auto-resize unite buffer, open unite buffers
" in insert mode, hide resource names in buffers with multiple source, open
" buffers in synchronous mode for no delay
call unite#custom#profile('default', 'context', {
      \ 'prompt' : '› ',
      \ 'prompt_visible' : 1,
      \ 'auto_resize' : 1,
      \ 'start_insert' : 1,
      \ 'hide_source_names' : 1,
      \ 'unique' : 1,
      \ })
" Use fuzzy matching
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" Sort search results (not sorted by default with fuzzy matching)
call unite#filters#sorter_default#use(['sorter_rank'])

" Open buffers
nnoremap <silent> <C-K>b :<C-U>Unite
      \ buffer
      \ -buffer-name=buffers
      \ <CR>

" Vim commands
nnoremap <silent> <C-K>c :<C-U>Unite
      \ command
      \ -buffer-name=commands
      \ <CR>

" List files in current directory, list git repository files recursively
nnoremap <silent> <C-K>f :<C-U>Unite
      \ file
      \ file_rec/git:--cached:--exclude-standard
      \ -buffer-name=files
      \ -resume
      \ -input=
      \ <CR>

" Run vimgrep
nnoremap <silent> <C-K>g :<C-U>Unite
      \ vimgrep
      \ -buffer-name=find
      \ <CR>

" Call unite settings function when opening unite buffers
augroup Unite
  autocmd FileType unite call s:unite_settings()
augroup END

function! s:unite_settings()
  " Short filename
  setlocal statusline=%t
  " Press escape to exit unite buffers
  nmap <buffer> <Esc>   <Plug>(unite_exit)
  imap <buffer> <Esc>   <Plug>(unite_exit)
  " Press tab to autocomplete based on result
  imap <buffer> <Tab>   <Plug>(unite_complete)
  " Press <C-J> or <C-K> to cycle through results
  imap <buffer> <C-J>   <Plug>(unite_select_next_line)
  imap <buffer> <C-K>   <Plug>(unite_select_previous_line)
  " Press <C-P> to open result in horizontal split, <C-V> for vertical split
  " Note: <C-S> conflicts with vim-surround
  nnoremap <silent><buffer><expr> <C-P> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-P> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C-V> unite#do_action('vsplit')
  inoremap <silent><buffer><expr> <C-V> unite#do_action('vsplit')
endfunction

" SuperTab
" --------
" Highlight the longest result
let g:SuperTabLongestHighlight = 1
" Type more characters to narrow longest match
let g:SuperTabLongestEnhanced = 1
" Cancel completion mode, preserving current text
let g:SuperTabCrMapping = 1
" Use context to determine type of autocomplete
let g:SuperTabDefaultCompletionType = "context"
" Fall back to standard keyword completion
let g:SuperTabContextDefaultCompletionType = '<C-P>'
" Available completion contexts
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
" Discover omnifunc, if set
let g:SuperTabContextDiscoverDiscovery = ["&omnifunc:<C-X><C-O>"]

" Call SuperTab chaining function
augroup SuperTab
  autocmd Filetype * call UserSuperTabChain()
augroup END

" If omnicompletion is available, chain it with keyword completion
function UserSuperTabChain()
  if &omnifunc != ''
    call SuperTabChain(&omnifunc, '<C-P>')
  endif
endfunction

" Vim Multiple Cursors
" --------------------
" Disable escape exiting directly from visual mod
let g:multi_cursor_exit_from_visual_mode = 0
" Disable escape exiting directly from insert mode
let g:multi_cursor_exit_from_insert_mode = 0
" Allow additional motions in multiple cursors mode
let g:multi_cursor_normal_maps = {
      \ 'd' : 1,
      \ 'c' : 1,
      \ 'r' : 1,
      \ 'x' : 1,
      \ }

" Vim Expand Region
" -----------------
let g:expand_region_text_objects = {
      \ 'i]' : 1,
      \ 'ib' : 1,
      \ 'iB' : 1,
      \ 'it' : 1,
      \ 'at' : 1,
      \ }

" Vim EasyMotion
" --------------
" Prompt
let g:EasyMotion_prompt = '→ '
" Press enter to jump to first match
let g:EasyMotion_enter_jump_first = 1
" Vertical motions attempt to stay in current column
let g:EasyMotion_startofline = 0

" Map EasyMotion prefix to <Leader>
map <Leader> <Plug>(easymotion-prefix)
" EasyMotion for downward line motion
map <Leader>j <Plug>(easymotion-j)
" EasyMotion for upward line motion
map <Leader>k <Plug>(easymotion-k)
" Two character search
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
" EasyMotion search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" EasyMotion next/prev
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" SYNTAX
" =============================================================================
syntax on
filetype plugin indent on

" FILETYPES
" =============================================================================
augroup filetypes
  autocmd BufNewFile,BufReadPre *.inc set filetype=php
  autocmd BufNewFile,BufReadPre *.install set filetype=php
augroup END

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
" Autocomplete, match longest substring, always show menu
set completeopt=longest,menu
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
