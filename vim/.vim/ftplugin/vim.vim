colorscheme molokai

" function! Highlight(group, fg, bg, style)
"   exec "hi " . a:group
"         \ . " ctermfg=" . a:fg["cterm"]
"         \ . " ctermbg=" . a:bg["cterm"]
"         \ . " cterm=" . a:style["cterm"]
"         \ . " guifg=" . a:fg["gui"]
"         \ . " guibg=" . a:bg["gui"]
"         \ . " gui=" . a:style["gui"]
" endfunction
" "let s:charcoal = { "cterm": 235, "gui": "#262626" }
" let s:charcoal = { "cterm": 235, "gui": "#2B2B2B" }
" let s:white = { "cterm": 231, "gui": "#ffffff" }
" let s:none = { "cterm": "NONE", "gui": "NONE" }
" let s:yellow = { "cterm": 228, "gui": "#ffff87" }
" let s:darker_grey = { "cterm": 238, "gui": "#444444" }
" call Highlight("Normal", s:white, s:charcoal, s:none)
" call Highlight("CursorLineNR", s:yellow, s:none, s:none)
" call Highlight("LineNr", s:darker_grey, s:none, s:none)
