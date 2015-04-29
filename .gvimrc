" GUI
" =============================================================================
" Set default GUI font for Windows
if has("gui_win32")
  set guifont=Consolas:h10
endif

" Set cursor line number
highlight CursorLineNr guifg=#657b83
" Set initial window height
set lines=48
" Set initial window width
set columns=84
" Use console dialogs
set guioptions+=c
" Remove menu bar
set guioptions-=m
" Remove toolbar
set guioptions-=T
" Remove right scrollbar on vertical split
set guioptions-=R
" Remove right scrollbar
set guioptions-=r
" Remove left scrollbar on vertical split
set guioptions-=L
" Remove left scrollbar
set guioptions-=l
" Remove horizontal scrollbar
set guioptions-=b
