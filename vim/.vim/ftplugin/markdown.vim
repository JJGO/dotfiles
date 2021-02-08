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

" Enable Goyo by default on markdown files
" autocmd FileType markdown Goyo

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

" Configuration for vim-markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'tab'
let g:vim_markdown_follow_anchor = 1

" Vim thesaurus
" let g:tq_language=['en']
" let g:tq_enabled_backends=["mthesaur_txt", "datamuse_com"]
" let g:tq_online_backends_timeout = 0.4

" let g:tq_mthesaur_file="~/.vim/bundle/thesaurus_query.vim/mthesaur.txt"


