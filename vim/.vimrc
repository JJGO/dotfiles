" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
" mkdir -p ~/.vim/bundle
" git clone git://github.com/wikitopian/hardmode.git ~/.vim/bundle/hardmode
" git clone http://github.com/sjl/gundo.vim.git ~/.vim/bundle/gundo
" git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
" git clone https://github.com/preservim/nerdcommenter.git ~/.vim/bundle/nerdcommenter
" git clone --depth=1 https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic
" git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/plugins/start/lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " VI compatible mode is disabled so that VIm things work

" Settings from https://dougblack.io/words/a-good-vimrc.html

" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:molokai_original = 1
colorscheme molokai " Monokai-like colorscheme
" colorscheme badwolf         " awesome colorscheme
syntax enable           " enable syntax processing

" Spaces & Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces, mainly because of python

" UI Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number              " show line numbers
set relativenumber      " show relative numbering
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
filetype plugin on      " load filetype specific plugin files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set laststatus=2        " Show the status line at the bottom
set mouse+=a            " A necessary evil, mouse support
set noerrorbells visualbell t_vb=    "Disable annoying error noises
set splitbelow          " Open new vertical split bottom
set splitright          " Open new horizontal splits right
" Buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden              " Allows having hidden buffers (not displayed in any window)

" Sensible stuff 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start     " Make backspace behave in a more intuitive way
nmap Q <Nop>
" 'Q' in normal mode enters Ex mode. You almost never want this.
map <C-a> <Nop>   " Unbind for tmux
map <C-x> <Nop>


" Leader Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "       " leader is space
" jk is escape
inoremap jk <esc>
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" save session,  After saving a Vim session, you can reopen it with vim -S.
nnoremap <leader>s :mksession<CR>

"Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " Ignore case in searches by default
set smartcase           " But make it case sensitive if an uppercase is entered
" turn off search highlight
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

" Undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir


" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
" nnoremap <space> za
set foldmethod=indent   " fold based on indent level
" This is especially useful for me since I spend my days in Python.
" Other acceptable values are marker, manual, expr, syntax, diff.
" Run :help foldmethod to find out what each of those do.

" Movement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]

" CtrlP settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Order matching files top to bottom
let g:ctrlp_match_window = 'bottom,order:ttb'
" Always open files in new buffers
let g:ctrlp_switch_buffer = 0
" Lets us change the working directory during a Vim session and make CtrlP
" respect that change.
let g:ctrlp_working_path_mode = 0
" Use rg to search instead
" https://elliotekj.com/2016/11/22/setup-ctrlp-to-use-ripgrep-in-vim/
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" Ignore files for completion
set wildignore+=*/.git/*,*/tmp/*,*.swp

" CtrlP buffer remap
" nnoremap ; :CtrlPBuffer<CR>

" show hidden files
let g:ctrlp_show_hidden = 1


" Launch config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect()                      " use pathogen

" GUndo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>u :GundoToggle<CR>
if has('python3')
    let g:gundo_prefer_python3 = 1
endif

"Tmux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" These lines change the cursor from block cursor mode to vertical bar cursor mode when using tmux.
" Without these lines, tmux always uses block cursor mode.

" Backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set backup
"set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set backupskip=/tmp/*,/private/tmp/*
"set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set writebackup

" Custom Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction


nnoremap <leader>t :call ToggleNumber()<CR>
nnoremap <leader>s :call <SID>StripTrailingWhitespaces()<CR>

" Lose Bad Habits
" http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove newbie crutches in Command Mode
" cnoremap <Down> <Nop>
" cnoremap <Left> <Nop>
" cnoremap <Right> <Nop>
" cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

" Enable hard home so hjkl are disabled
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()


" Lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --INSERT-- is unncessary because of lightline
set noshowmode


" Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>
nnoremap <Leader>tb :TagbarToggle<CR>


" Vim GitGutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set updatetime=100
map <Leader>gi :GitGutterToggle<CR>
let g:gitgutter_enabled = 0

" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F7> :NERDTreeToggle<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
" Close vim if only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDCommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'


" Vim Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:markdown_fenced_languages = [
    \ 'bash=sh',
    \ 'c',
    \ 'coffee',
    \ 'erb=eruby',
    \ 'javascript',
    \ 'json',
    \ 'perl',
    \ 'python',
    \ 'ruby',
    \ 'yaml',
    \ 'go',
\]
let g:vim_markdown_conceal = 2

" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/usr/local/opt/fzf

" Easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader> <Plug>(easymotion-prefix)

" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'

" incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" incsearch-easymotion
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)
map <Leader>/ <Plug>(incsearch-easymotion-/)
map <Leader>? <Plug>(incsearch-easymotion-?)
map <Leader>g/ <Plug>(incsearch-easymotion-stay)

" vim-sneak behaviour through easymotion
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>t <Plug>(easymotion-t2)


" ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>at :ALEToggle<CR>
let g:ale_enabled = 1

" Indentline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_enabled = 0

" Argwrap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>ar :ArgWrap<CR>

" FZF.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>


" Quick Save
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>qq :qa!<CR>

" Quick copy paste
nmap <Leader>y "+y
nmap <Leader>d "+d
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

set ttyfast

" Split with leader
nnoremap <Leader>- :sp<CR>
nnoremap <Leader>\| :vsp<CR>


let g:limelight_conceal_ctermfg = 'gray'

"autocmd! User GoyoEnter Limelight
"autocmd! User GoyoLeave Limelight!
"
"
