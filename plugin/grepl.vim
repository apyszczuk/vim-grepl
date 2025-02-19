if exists ('g:loaded_grepl')
    finish
endif
let g:loaded_grepl = 1

set grepprg =internal

let g:grepl_from        = "."
let g:grepl_flags       = ""
let g:grepl_function    = "grepl#grepl_open"
let g:grepl_mappings    = 1

command! -nargs=+ Grepl :call function(g:grepl_function)(<f-args>)


nnoremap <plug>(grepl-normal-whole-word)    :Grepl \<<C-R>=expand("<cword>")<CR>\><CR>
nnoremap <plug>(grepl-normal-word)          :Grepl <C-R>=expand("<cword>")<CR><CR>
vnoremap <plug>(grepl-visual-whole-word)    y:Grepl \<<C-R>"\><CR>
vnoremap <plug>(grepl-visual-word)          y:Grepl <C-R>"<CR>

if g:grepl_mappings == 1
    nnoremap m*  <Plug>(grepl-normal-whole-word)
    nnoremap mg* <Plug>(grepl-normal-word)
    vnoremap m*  <Plug>(grepl-visual-whole-word)
    vnoremap mg* <Plug>(grepl-visual-word)
endif
