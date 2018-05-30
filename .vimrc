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

" Add, change, and delete delimiters
Plugin 'tpope/vim-surround'

" Execute external commands
Plugin 'Shougo/vimproc.vim'

" Unified search interface
Plugin 'Shougo/unite.vim'

" Edit several things at once with multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" Vastly enhanced movement controls
Plugin 'Lokaltog/vim-easymotion'

" Use <Tab> for autocompletion
Plugin 'ervandew/supertab'

" Syntax and style checking
Plugin 'scrooloose/syntastic'

" Improved commenting motions
Plugin 'scrooloose/nerdcommenter'

" Puppet syntax support
Plugin 'puppetlabs/puppet-syntax-vim'

" HTML5 syntax support
Plugin 'othree/html5.vim'

" CSS3 syntax support
Plugin 'JulesWang/css.vim'
Plugin 'npacker/vim-css3complete'
Plugin 'hail2u/vim-css3-syntax'

" Sass syntax support
Plugin 'cakebaker/scss-syntax.vim'

" JavaScript syntax improved
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'npacker/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'

" PHP syntax improved
Plugin '2072/PHP-Indenting-for-Vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'shawncplus/phpcomplete.vim'

" Twig syntax support
Plugin 'lumiliet/vim-twig'

" Python syntax improved
Plugin 'hdima/python-syntax'
Plugin 'Vimjas/vim-python-pep8-indent'

" Papyrus syntax support
Plugin 'sirtaj/vim-papyrus'

" Java syntax improved
Plugin 'npacker/vim-java-syntax-after'

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
  autocmd BufNewFile,BufReadPre *.inc     set filetype=php
  autocmd BufNewFile,BufReadPre *.install set filetype=php
  autocmd BufNewFile,BufReadPre *.test    set filetype=php
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

" Syntastic
" ------------------------------------------------------------------------------
let g:syntastic_error_symbol = '×'
let g:syntastic_warning_symbol = '×'
let g:syntastic_style_error_symbol = '×'
let g:syntastic_style_warning_symbol = '×'
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open = 1
" Use Drupal standard for PHP CodeSniffer
let g:syntastic_php_phpcs_args = '--standard=Drupal'
" Disable some pylint warnings
let g:syntastic_python_pylint_args = '--disable=W0142,W0401,W0614,R0903'
" Use make as C checker
let g:syntastic_c_checkers = ['make', 'gcc']
" Use scss_lint as Sass checker
let g:syntastic_scss_checkers = ['scss_lint', 'sass']

" PHP Syntax
" ------------------------------------------------------------------------------
" Don't trigger on PHP close tag in comments
let php_parent_error_open = 1
" Ignore short tags
let php_noShortTags = 1
" Sane PHP switch indentation
let g:PHP_vintage_case_default_indent = 1
" Remove DOS line-endings when unix file encoding set
let g:PHP_RemoveCRwhenUnix = 1

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

" CSS/SASS Syntax
" ------------------------------------------------------------------------------
" Fix highlighting of some properties with dashes
augroup CSS3SyntaxOverride
  autocmd!
  autocmd FileType css,scss setlocal iskeyword+=-
augroup END

" Papyrus Syntax
" ------------------------------------------------------------------------------
" Skyrim path
let g:skyrim_install_path = 'E:\Steam\SteamApps\common\skyrim'

" Unite
" ------------------------------------------------------------------------------
" We'll set the statusline ourselves
let g:unite_force_overwrite_statusline = 0
" Cache as few as 10 files
let g:unite_source_rec_min_cache_files = 10
" Cache up to 100,000 files
let g:unite_source_rec_max_cache_files = 100000
" Allow more space for file/directory separation converter
let g:unite_converter_file_directory_width = 80

" Match using fuzzy string
call unite#filters#matcher_default#use([
      \ 'matcher_fuzzy',
      \ ])

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
      \ 'prompt' : '› ',
      \ 'prompt_visible' : 1,
      \ 'prompt_focus' : 1,
      \ 'start_insert' : 1,
      \ 'winheight' : 10,
      \ })

" Prevent vimgrep source from automatically closing unite buffer when action is
" taken
call unite#custom#profile('source/vimgrep', 'context', {
      \ 'no_quit' : 1,
      \ })

" Convert candidates to relative word before matching
call unite#custom#source('file_rec/git', 'matchers', [
      \ 'converter_relative_word',
      \ 'matcher_default',
      \ ])

" Convert each git source match to the filename and parent directory
call unite#custom#source('file_rec/git', 'converters', [
      \ 'converter_file_directory',
      \ ])

" Only show unique candidates in the files profile
call unite#custom#profile('files', 'context', {
      \ 'unique' : 1,
      \ })

" Sort all candidates in the files profile
call unite#custom#profile('files', 'sorters', [
      \ 'sorter_selecta',
      \ ])

" List files in current directory, list git repository files recursively
nnoremap <silent> <leader>p :<C-U>Unite
      \ -profile-name=files
      \ -buffer-name=files
      \ file
      \ file_rec/git:--cached:--exclude=vendor/gem:--exclude=node_modules:--exclude-standard
      \ file/new
      \ <CR>

" Custom Find command to invoke vimgrep
command! Find Unite
      \ -profile-name=find
      \ -buffer-name=find
      \ vimgrep

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
  " Unmap unite <Tab> mapping
  nunmap <buffer> <Tab>
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

" SuperTab
" ------------------------------------------------------------------------------
" Highlight the longest result
" let g:SuperTabLongestHighlight = 1
" Type more characters to narrow longest match
let g:SuperTabLongestEnhanced = 1
" Cancel completion mode, preserving current text
let g:SuperTabCrMapping = 1

" Call SuperTab chaining function
augroup SuperTabSettings
  autocmd!
  autocmd Filetype * call UserSuperTabChain()
augroup END

" If omnicompletion is available, chain it with keyword completion
function! UserSuperTabChain()
  if &omnifunc != ''
    call SuperTabChain(&omnifunc, '<C-X><C-P>')
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
      \ '"' : 1,
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

" Nerdcommeter
" ------------------------------------------------------------------------------
" Use leading space after comment delimiter
let NERDSpaceDelims=1

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
" Smart indentation
set smartindent
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
" Recognize numbered lists
set formatoptions+=n
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

" Set color of the Syntastic warning marker to yellow
highlight SyntasticWarningSign ctermfg=1 guifg=Red
" Clear highlighting default on sign column
highlight clear SignColumn

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
" Disable audible bell
set noerrorbells
" Disable visual bell
set novisualbell
" Wrap searches around the end of the files
set wrapscan
" Autocomplete, match longest substring, always show menu
set completeopt=longest,menu
" Display diff filler lines, always vertical split
set diffopt=filler,vertical
" Display at least one line between cursor and horizontal window borders
set scrolloff=1
" Amount of screen to scroll when reaching last line
set scrolljump=-100
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
set statusline+=\ %#StatusLineNC#
set statusline+=\ %LL
set statusline+=\ %*
set statusline+=%{&fileformat=='unix'?'\ LF':''}
set statusline+=%{&fileformat=='dos'?'\ CLRF':''}
set statusline+=%{&fileformat=='mac'?'\ CR':''}
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" Separator
set statusline+=%=
" Modified
set statusline+=\ %3m
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
" Limit number of columns to search for syntax items
set synmaxcol=320
" Reduce number of syntax lines scanned.
syntax sync maxlines=120
syntax sync minlines=60

" BACKUP
" ==============================================================================
" Disable annoying backup/swap files
set nobackup
set nowritebackup
set noswapfile
