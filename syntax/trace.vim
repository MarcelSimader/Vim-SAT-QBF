" Vim syntax file for SAT and QBF traces
" Author: Marcel Simader (marcel0simader@gmail.com)
" Date: 25.08.2024
" (c) Marcel Simader 2024

" quit when a syntax file was already loaded
if exists('b:current_syntax')
    finish
endif

" ~~~~~~~~~~~~~~~~~~~~ Syntax ~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~ General
syntax keyword TraceKeywords         s v V d
            \ contained
syntax match   TraceComment          /^\s*c.*$/

" ~~~~~~~~~~ Clause lines
syntax match   TraceLiteral          /-\?\d\+/
            \ contains=TraceZero
syntax keyword TraceZero             0
            \ contained

" ~~~~~~~~~~ Trace lines
syntax match  TraceSolutionSpecifier /^\s*s\s\+.*$/
            \ transparent contains=TraceKeywords,TraceSolutionType
syntax match  TraceSolutionType      /\w\+/
            \ contained
syntax match  TraceSolutionLine      /^\s*[vV]\s\+.*$/
            \ transparent contains=TraceKeywords,TraceLiteral
syntax match  TraceDeletionLine      /^\s*d\s\+.*$/
            \ contains=TraceKeywords,TraceLiteral

" ~~~~~~~~~~~~~~~~~~~~ Highlight ~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~ General
highlight default link TraceKeywords      Keyword
highlight default link TraceComment       Comment

" ~~~~~~~~~~ Clause lines
highlight default link TraceLiteral       Normal
highlight default link TraceZero          SpecialChar

" ~~~~~~~~~~ Trace lines
highlight default link TraceSolutionType  Statement
highlight default link TraceDeletionLine  Operator

let b:current_syntax = 'trace'

