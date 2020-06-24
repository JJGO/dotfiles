set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

let python_highlight_all = 1  " python-syntax package

"""""""""""" ALE
" Check Python files with flake8 and pylint.
let g:ale_enabled = 1
let b:ale_linters = ['flake8']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0
