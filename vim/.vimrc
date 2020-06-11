"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " VI compatible mode is disabled so that VIm things work

call plug#begin()


" Load plugins
" Per file editor config
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'



" Search
Plug 'romainl/vim-cool'               " Disables highlight when search is done
Plug 'haya14busa/incsearch.vim'       " Better incremental search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }  " FZF plugin, makes Ctrl-P unnecessary
Plug 'junegunn/fzf.vim'
" Plug 'airblade/vim-rooter'

" Movement
Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'wikitopian/hardmode'            " Disable arrow keys and similar

" Text Manipulation
Plug 'tpope/vim-sensible'             " Some better defaults
Plug 'tpope/vim-unimpaired'           " Pairs of mappings
Plug 'tpope/vim-surround'             " Surround with parentheses & co
Plug 'joom/vim-commentary'            " To comment stuff out
Plug 'terryma/vim-multiple-cursors'   " Multiple cursors like sublime
Plug 'godlygeek/tabular'              " For alignment
Plug 'foosoft/vim-argwrap'            " convert lists of arguments into blocks of arguments
Plug 'tpope/vim-endwise'              " Ends control flow indentifiers
Plug 'tpope/vim-repeat'               " Adds repeat thorugh . to other packages
Plug 'tpope/vim-speeddating'          " Dates in vim

" GUI enhancements
Plug 'itchyny/lightline.vim'          " Better Status Bar
Plug 'mhinz/vim-startify'             " Better start screen
Plug 'scrooloose/nerdtree'            " File explorer
Plug 'sjl/gundo.vim'                  " Undo Tree
Plug 'majutsushi/tagbar'              " Pane with tags
Plug 'machakann/vim-highlightedyank'  " Highlight yanks
Plug 'andymass/vim-matchup'           " Highlight corresponding blocks e.g. if - fi in bash
Plug 'kshenoy/vim-signature'          " Show marks in the gutter
Plug 'yggdroot/indentline'            " Shows indentation levels
Plug 'tpope/vim-eunuch'               " Unix helpers
" Git GUI
Plug 'airblade/vim-gitgutter'         " Git gutter
Plug 'tpope/vim-fugitive'             " Git interface
Plug 'xuyuanp/nerdtree-git-plugin'    " Show status of files in NerdTree
" Tmux GUI
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'christoomey/vim-tmux-navigator'


" Autocomplete
Plug 'ervandew/supertab'
" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntactic language support
Plug 'w0rp/ale'                        " Linting engine
Plug 'plasticboy/vim-markdown'         " Markdown support
Plug 'cespare/vim-toml'                " TOML support
Plug 'stephpy/vim-yaml'                " YAML support
Plug 'elzr/vim-json'                   " Better JSON support
Plug 'rust-lang/rust.vim'              " Rust support
Plug 'glench/vim-jinja2-syntax'        " Jinja2 support
Plug 'lervag/vimtex'                   " Latex support
Plug 'pearofducks/ansible-vim'         " Ansible support
Plug 'mechatroner/rainbow_csv'         " CSV color coding
Plug 'ap/vim-css-color'                " CSS colors
Plug 'luochen1990/rainbow'             " Rainbow parentheses
Plug 'vim-pandoc/vim-pandoc'           " Pandoc support
Plug 'vim-pandoc/vim-pandoc-syntax'    " Pandoc syntax
Plug 'chrisbra/colorizer'              " Colorize color codes
" Plug 'vim-python/python-syntax'
Plug 'sentientmachine/pretty-vim-python'

" Colorschemes
" Plug 'tomasr/molokai'                  " Monokai and friends
" Plug 'sickill/vim-monokai'
" Plug 'patstockwell/vim-monokai-tasty'
" Plug 'erichdongubler/vim-sublime-monokai'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'         " Base16 themes
" Plug 'flazz/vim-colorschemes'          " Bunch of color schemes
Plug 'gerw/vim-hilinktrace'            " Syntax Highlighting Tracer

" Writing
Plug 'junegunn/goyo.vim'               " Distraction free mode
Plug 'junegunn/limelight.vim'          " Focus on current paragraph
Plug 'rhysd/vim-grammarous'            " GrammarCheck using LanguageTool
Plug 'ron89/thesaurus_query.vim'       " Synonym query

" Other
Plug 'wakatime/vim-wakatime'           " Wakatime time tracking
call plug#end()


" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" if exists('+termguicolors')
  " let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  " let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  " set termguicolors
" endif
syntax on           " enable syntax processing
let g:molokai_original = 1


" colorscheme molokai " Monokai-like colorscheme
" let g:vim_monokai_tasty_italic = 1
" colorscheme vim-monokai-tasty
" colorscheme monojai
" colorscheme solarized8_dark
colorscheme molokai
" colorscheme gruvbox
" let islate=$ISLATE
"         colorscheme sublimemonokai

" if islate == '1'
"         " colorscheme gruvbox
"         colorscheme molojai
" else
"         colorscheme sublimemonokai
" endif

" Spaces & Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " Insert 4 spaces on a tab
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
set linebreak           " Have lines wrap instead of continue off-screen
set scrolloff=12        " Keep cursor in approximately the middle of the screen
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
"inoremap jk <esc>
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
" call pathogen#infect()                      " use pathogen
" Helptags

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
let g:ale_enabled = 0

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
nmap <Leader>w :call <SID>StripTrailingWhitespaces()<CR>:w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wq :call <SID>StripTrailingWhitespaces()<CR>:wq<CR>
"nmap <Leader>qq :qa!<CR>

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
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

" Very magic by default
" nnoremap ? ?\v
" nnoremap / /\v
" cnoremap %s/ %sm/

set ttyfast

" Split with leader
nnoremap <Leader>- :sp<CR>
nnoremap <Leader>\| :vsp<CR>


let g:limelight_conceal_ctermfg = 'gray'

"autocmd! User GoyoEnter Limelight
"autocmd! User GoyoLeave Limelight!
"

" Vim Signature
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>m :SignatureToggle<CR>
let g:SignatureEnabledAtStartup = 0

" Vim Startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_custom_header =[]

nnoremap <Leader>` :Startify<CR>



autocmd BufNewFile,BufRead *.yml.j2 set syntax=yaml

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

vnoremap <Tab> >
vnoremap <S-Tab> <

nnoremap K :move-2<CR>==
nnoremap J :move+<CR>==
xnoremap K :move-2<CR>gv=gv
xnoremap J :move'>+<CR>gv=gv

set modeline

" Spellcheck Keyboard shorcut
" https://vim.fandom.com/wiki/Toggle_spellcheck_with_function_keys
nnoremap <F5> :setlocal spell! spelllang=en_us<CR>


"" Markdown config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://secluded.site/vim-as-a-markdown-editor/
"
" Treat all .md files as markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Highlight the line the cursor is on
autocmd FileType markdown set cursorline

" Set spell check to British English
autocmd FileType markdown setlocal spell spelllang=en_us

" Here’s a short crash course in Vim spelling commands:

"     [s to search for misspelled words above the cursor
"     ]s to search for misspelled words below the cursor
"     z= to see replacement suggestions
"     zg to add the word to your dictionary

nnoremap <C-g> :Goyo<CR>

autocmd FileType markdown Goyo

" Vim Markdown
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

" Configuration for vim-markdown
let g:vim_markdown_conceal = 2
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'tab'
let g:vim_markdown_follow_anchor = 1

" Vim thesaurus
let g:tq_language=['en']
let g:tq_enabled_backends=["mthesaur_txt", "datamuse_com"]
let g:tq_online_backends_timeout = 0.4

let g:tq_mthesaur_file="~/.vim/bundle/thesaurus_query.vim/mthesaur.txt"
