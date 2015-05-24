" GUI
" =============================================================================
" Set default GUI font for Windows
if has("gui_win32")
  set guifont=Consolas:h10:cDEFAULT
endif

" Function for setting the cursor line number color
function! SetCursorLineColor()
  highlight CursorLineNr guifg=#657b83
endfunction

" Autocommands when changing color scheme
augroup ColorSchemeSettings
  autocmd!
  autocmd ColorScheme * call SetCursorLineColor()
augroup END

" Set cursor line number
call SetCursorLineColor()
" Set initial window height
set lines=48
" Set initial window width
set columns=84
" Set screen height buffer
set guiheadroom=0
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
