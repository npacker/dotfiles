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
" Remove menu bar
set guioptions-=m
" Remove toolbar
set guioptions-=T
" Remove scrollbars
set guioptions-=R
set guioptions-=r
set guioptions-=L
set guioptions-=l
set guioptions-=b
