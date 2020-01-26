
execute pathogen#infect()
syntax on
filetype plugin indent on

let g:python_host_prog = '/Users/josejavier/.pyenv/versions/2.7.14/bin/python'
let g:python3_host_prog = '/Users/josejavier/.pyenv/versions/3.7.0a3/bin/python' 

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
" Live preview of substituion
set inccommand=nosplit
source ~/.vimrc
