" Author: Marcel Simader (marcel0simader@gmail.com)
" Date: 25.08.2024
" (c) Marcel Simader 2024

let b:save_cpo = &cpo
set cpo&vim

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal comments& comments=:c
setlocal formatoptions& formatoptions+=ro

let b:undo_ftplugin = "setlocal fo< com<"
let &cpo = b:save_cpo

