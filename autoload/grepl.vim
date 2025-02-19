if exists ('g:autoloaded_grepl')
    finish
endif
let g:autoloaded_grepl = 1

function! grepl#grepl(pattern, flags, from, files, commands) 
    let l:files = a:from . "/**"

    if len(a:files) > 0
        let l:files = join(a:files, " ")
    endif

    let l:commands = ""
    if len(a:commands) > 0
        let l:commands = "|" . join(a:commands, "|")
    endif

    execute "lgrep /" . a:pattern . "/" . a:flags . " " . l:files . " " . l:commands
endfunction

function! grepl#grepl_open(pattern, ...)
    call grepl#grepl(a:pattern,
    \       g:grepl_flags,
    \       g:grepl_from,
    \       a:000,
    \       [":lopen"])
endfunction

function! grepl#grepl_open_far_right(pattern, ...)
    call grepl#grepl(a:pattern,
    \       g:grepl_flags,
    \       g:grepl_from,
    \       a:000,
    \       [":lopen", ":wincmd L"])
endfunction
