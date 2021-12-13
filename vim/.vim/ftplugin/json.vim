function! TogglePrettyJson()
    if( line('$') == 1)
        %!python -m json.tool
    else
        %j
    endif
endfunction

nnoremap <Leader>of :call TogglePrettyJson()<CR>
