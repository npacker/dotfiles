" VUNDLE SETUP
" ==============================================================================
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
" ==============================================================================
" Vundle
Plugin 'gmarik/Vundle.vim'

" Use the the . operator with plugin commands
Plugin 'tpope/vim-repeat'

" Wrapper for Git on Vim commandline
Plugin 'tpope/vim-fugitive'

" Add, change, and delete delimiters
Plugin 'tpope/vim-surround'

" Execute external commands
Plugin 'Shougo/vimproc.vim'

" Unified search interface
Plugin 'Shougo/unite.vim'

" Expand the current visual selection
Plugin 'terryma/vim-expand-region'

" Edit several things at once with multiple cursors
Plugin 'terryma/vim-multiple-cursors'

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
Plugin 'npacker/vim-css3complete'

" JavaScript syntax improved
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'jelera/vim-javascript-syntax'

" PHP syntax improved
Plugin '2072/PHP-Indenting-for-Vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'shawncplus/phpcomplete.vim'

" C syntax improved
Plugin 'justinmk/vim-syntax-extra'

" Solarized color scheme
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

" SYNTAX
" ==============================================================================
syntax on
filetype plugin indent on

" FILETYPES
" ==============================================================================
augroup FiletypeSettings
  autocmd!
  autocmd BufNewFile,BufReadPre *.inc set filetype=php
  autocmd BufNewFile,BufReadPre *.install set filetype=php
augroup END

" ENCODING
" ==============================================================================
" Default character encoding
set encoding=utf-8
" Default file encoding
set fileencoding=utf-8
" File encoding hints
set fileencodings=utf-8,latin1,usc-bom
" Possible end of line formats
set fileformats=unix,mac,dos

" PLUGIN CONFIG
" ==============================================================================

" PHP Syntax
" ------------------------------------------------------------------------------
" Don't trigger on PHP close tag in comments
let php_parent_error_open = 1
" Sane indenting for switch
let g:PHP_vintage_case_default_indent = 1

" Customize PHP syntax highlighting
function! PhpSyntaxOverride()
  highlight! default link phpDocTags       phpDefine
  highlight! default link phpDocParam      phpType
  highlight! default link phpDocIdentifier phpIdentifier
endfunction

" Call PHP Syntax override function
augroup PhpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" Unite
" ------------------------------------------------------------------------------
" We'll set the statusline ourselves
let g:unite_force_overwrite_statusline = 0
" Cache as few as 10 files
let g:unite_source_rec_min_cache_files = 10
" Cache up to 100,000 files
let g:unite_source_rec_max_cache_files = 100000

" Set default options for all unite buffers:
" - auto-resize unite buffer
" - hide resource names in buffers with multiple source
" - perform the default action immediately if only one candidate, do not open
"   for no candidates
" - prompt always visible
" - open buffers in insert mode
" - show only unique candidates, filter duplicates
" - unite buffers have 10 line maximum height
call unite#custom#profile('default', 'context', {
      \ 'auto_resize' : 1,
      \ 'hide_source_names' : 1,
      \ 'immediately' : 1,
      \ 'prompt' : '› ',
      \ 'prompt_visible' : 1,
      \ 'start_insert' : 1,
      \ 'unique' : 1,
      \ 'winheight' : 10,
      \ })
" Prevent vimgrep source from automatically closing unite buffer when action is
" taken
call unite#custom#profile('source/vimgrep', 'context', {
      \ 'no_quit' : 1,
      \ })
" Use fuzzy matching
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" Sort search results (not sorted by default with fuzzy matching)
call unite#filters#sorter_default#use(['sorter_rank'])
" Use context matcher for file source to allow standard vim wildcards
call unite#custom#source('file', 'matchers', 'matcher_context')

" Unite custom settings callback
function! s:unite_settings()
  let unite = unite#get_current_unite()

  if unite.profile_name ==# 'buffers'
    " Press <C-D> to delete the selected buffers
    nnoremap <silent><buffer><expr> <C-D> unite#do_action('delete')
  endif

  " Short filename
  setlocal statusline=%t
  " Unmap unite <C-P> mapping
  nunmap <buffer> <C-P>
  " Unmap unite <Backspace> exit mapping
  iunmap <buffer> <Backspace>
  " Press escape to exit unite buffers
  nmap <buffer> <Esc>   <Plug>(unite_all_exit)
  " Press <Tab> or <S-Tab> to cycle through results
  imap <buffer> <Tab>   <Plug>(unite_select_next_line)
  imap <buffer> <S-Tab> <Plug>(unite_select_previous_line)
  " Press <C-K> to open candiate in horizontal split
  nnoremap <silent><buffer><expr> <C-K> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-K> unite#do_action('split')
  " Press <C-V> to open candidate in vertical split
  nnoremap <silent><buffer><expr> <C-V> unite#do_action('vsplit')
  inoremap <silent><buffer><expr> <C-V> unite#do_action('vsplit')
endfunction

" Call unite settings function when opening unite buffers
augroup UniteSettings
  autocmd!
  autocmd FileType unite call s:unite_settings()
augroup END

" Custom Unite mappings:
" List files in current directory, list git repository files recursively
nnoremap <silent> <C-P> :<C-U>Unite
      \ file_rec/git:--cached:--exclude-standard:--other
      \ file
      \ file/new
      \ directory/new
      \ -buffer-name=goto
      \ <CR>
" Custom Buffers command to list open buffers
command Buffers Unite
      \ buffer
      \ -toggle
      \ -buffer-name=buffers
" Custom Find command to invoke vimgrep
command Find Unite
      \ vimgrep
      \ -buffer-name=find

" SuperTab
" ------------------------------------------------------------------------------
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
augroup SuperTabSettings
  autocmd!
  autocmd Filetype * call UserSuperTabChain()
augroup END

" If omnicompletion is available, chain it with keyword completion
function UserSuperTabChain()
  if &omnifunc != ''
    call SuperTabChain(&omnifunc, '<C-P>')
  endif
endfunction

" Vim Multiple Cursors
" ------------------------------------------------------------------------------
" Disable escape exiting directly from visual mod
let g:multi_cursor_exit_from_visual_mode = 0
" Disable escape exiting directly from insert mode
let g:multi_cursor_exit_from_insert_mode = 0
" Allow additional motions in multiple cursors mode
let g:multi_cursor_normal_maps = {
      \ ';' : 1,
      \ ',' : 1,
      \ 'c' : 1,
      \ 'C' : 1,
      \ 'd' : 1,
      \ 'f' : 1,
      \ 'F' : 1,
      \ 'p' : 1,
      \ 'r' : 1,
      \ 't' : 1,
      \ 'T' : 1,
      \ 'x' : 1,
      \ }

" Disable the search key while in multi select mode
function! Multiple_cursors_before()
  noremap / <Nop>
endfunction

" Re-enable the search key after exiting multie select mode
function! Multiple_cursors_after()
  map  / <Plug>(easymotion-sn)
  omap / <Plug>(easymotion-tn)
endfunction

" Vim Expand Region
" ------------------------------------------------------------------------------
let g:expand_region_text_objects = {
      \ 'i]' : 1,
      \ 'ib' : 1,
      \ 'iB' : 1,
      \ 'it' : 1,
      \ 'at' : 1,
      \ }

" Vim EasyMotion
" ------------------------------------------------------------------------------
" Prompt character
let g:EasyMotion_prompt = '→ '
" Press enter to jump to first match
let g:EasyMotion_enter_jump_first = 1
" Vertical motions attempt to stay in current column
let g:EasyMotion_startofline = 0

" Map <Leader> to <SPACE>
map <Space> <Leader>
" Map EasyMotion prefix to <Leader>
map <Leader> <Plug>(easymotion-prefix)
" Character search
nmap s <Plug>(easymotion-s)
nmap t <Plug>(easymotion-t)
" Two character search
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>t <Plug>(easymotion-t2)
" EasyMotion search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" EasyMotion next/prev
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" FORMATTING
" ==============================================================================
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
" 80 column text width
set textwidth=80
" Auto format comments
set formatoptions+=c
" Auto insert comment leader on <CR>
set formatoptions+=r
" Auto insert comment leader on 'o' or 'O' command
set formatoptions+=o
" Allow comment formatting with gq
set formatoptions+=q
" Use second line of paragraph for indentation
set formatoptions+=2
" Remove comment leader when joining lines
set formatoptions+=j

" EDITING
" ==============================================================================
" Hide buffers instead of close them, allowing switching before saving
set hidden
" Set reasonable timout
set timeoutlen=2000
" Eliminate timeout when pressing <Esc>
set ttimeoutlen=0

" APPEARANCE
" ==============================================================================
" Tell vim that the background is dark
set background=dark
" Solarized color scheme
try
  colorscheme solarized
catch
  colorscheme default
endtry

" UI
" ==============================================================================
" Remove splash text
set shortmess+=I
" Line numbers
set number
" Always show command bar
set showcmd
" Show mode in command bar
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
" ==============================================================================
" Filename tail
set statusline=\ %t
" Filetype
set statusline+=\ %y
" Separator
set statusline+=%=
" Modified
set statusline+=%3m
" Line number
set statusline+=\ %3l:
" Column number
set statusline+=%-2c
" Pertentage of file
set statusline+=\ %p%%\ %*

" SEARCH
" ==============================================================================
" Incremental search, highlight for each character typed
set incsearch
" Assume global search by default
set gdefault
" Use <C-L> to clear last search hilight
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
" Use very magic regular expressions for search and replace
cnoremap %s/ %smagic/\v

" PERFORMANCE
" ==============================================================================
" Defer redraws for improved performance; with ttyfast, this buffers output
set lazyredraw
" Increase number of characters sent to terminal at once
set ttyfast

" BACKUP
" ==============================================================================
" Disable annoying backup/swap files
set nobackup
set nowritebackup
set noswapfile
