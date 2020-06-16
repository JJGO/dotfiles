
" execute pathogen#infect()
syntax on
filetype plugin indent on

let g:python3_host_prog = '~/.neovim/py3/bin/python'
let g:node_host_prog = '~/.neovim/node/bin/neovim-node-host'

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
" Live preview of substituion
set inccommand=nosplit

" Load vim config
source ~/.vimrc

" FZF Floating Window (NVIM only)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Let the input go up and the search list go down
let $FZF_DEFAULT_OPTS = '--layout=reverse'

"Open FZF and choose floating window
let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

function! OpenFloatingWin()
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  "Set the position, size, etc. of the floating window.
  "The size configuration here may not be so flexible, and there's room for further improvement.
  let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col + 30,
        \ 'width': width * 2 / 3,
        \ 'height': height / 2
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  "Set Floating Window Highlighting
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction
