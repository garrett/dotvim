" my default color scheme

" color terminal settings (cterm=NONE needed to clear flags)
hi Normal       ctermfg=LightGray   ctermbg=Black

hi Ignore       cterm=NONE      ctermfg=Black

hi Comment      cterm=NONE      ctermfg=Red
hi Constant     cterm=NONE      ctermfg=Magenta
hi Special      cterm=NONE      ctermfg=Yellow
hi Identifier   cterm=NONE      ctermfg=Green
hi Statement    cterm=NONE      ctermfg=Brown
hi PreProc      cterm=NONE      ctermfg=Blue
hi Type         cterm=NONE      ctermfg=Cyan

" GUI settings
hi Normal       guifg=LightGray     guibg=Black

hi Ignore       guifg=bg

hi Comment      guifg=Red       gui=bold
hi Constant     guifg=Magenta   gui=bold
hi Special      guifg=Yellow    gui=bold
hi Identifier   guifg=Green3    gui=NONE
hi Statement    guifg=Yellow3   gui=NONE
hi PreProc      guifg=Blue      gui=bold
hi Type         guifg=Cyan      gui=bold

" vi:ts=4 sw=4 expandtab
