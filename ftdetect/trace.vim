" Author: Marcel Simader (marcel0simader@gmail.com)
" Date: 25.08.2024
" (c) Marcel Simader 2024

augroup TraceFiletype
    autocmd!
    autocmd VimEnter,BufNewFile,BufRead *.rup,*.drup set ft=trace
    autocmd VimEnter,BufNewFile,BufRead *.rat,*.drat,*.lrat,*.frat set ft=trace
    autocmd VimEnter,BufNewFile,BufRead *.proof,*.trace,*.out set ft=trace
    autocmd VimEnter,BufNewFile,BufRead *.ferp,*.ferat set ft=trace
augroup END

