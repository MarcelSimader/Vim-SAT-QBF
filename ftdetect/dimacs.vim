" Author: Marcel Simader (marcel0simader@gmail.com)
" Date: 22.06.2023
" (c) Marcel Simader 2023

augroup DimacsFiletype
    autocmd!
    autocmd VimEnter,BufNewFile,BufRead *.dimacs,*.qdimacs,*.cnf,*.nnf,*.dnf,*.in
                \ set ft=dimacs
    autocmd VimEnter,BufNewFile,BufRead *
                \   for lnr in range(1, 12)
                \ |     if getline(lnr) =~? '\s*p\s\+\(cnf\|dnf\|nnf\)\(\s\+\d\+\)\{2}'
                \ |         set ft=dimacs | break
                \ |     endif
                \ | endfor
augroup END

