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
syntax match   TraceLiteral          /\<-\?\d\+\>/
            \ contains=TraceZero
syntax match   TraceIdentifier       /\<-\@<!\d\+\>/
            \ contained
syntax match   TraceZero             /\<0\>/
            \ contained

" ~~~~~~~~~~ Trace lines
syntax match  TraceSolutionSpecifier /^\s*s\s\+.*$/
            \ transparent contains=TraceKeywords,TraceSolutionType
syntax match  TraceSolutionType      /\<\w\+\>/
            \ contained
syntax match  TraceSolutionLine      /^\s*[vV]\s\+.*$/
            \ transparent contains=TraceKeywords,TraceLiteral

" ~~~~~~~~~~ RUP/RAT lines
syntax match  RUPDeletionLine        /^\s*d\s\+.*$/
            \ transparent contains=TraceKeywords,TraceLiteral

" ~~~~~~~~~~ LRAT lines
syntax match LRATDeletionLine
            \ /^\s*\d\+\s\+d\s\+\(\d\+\s\+\)*0\s*$/
            \ contains=LRATPrefix,TraceKeywords,TraceZero
syntax match LRATAdditionLine
            \ /^\s*\d\+\s\+\(-\?\d\+\s\+\)*0\s\+\(\d\+\s\+\)*\(-\d\+\s\+\(\d\+\s\+\)*\)*0\s*$/
            \ transparent
            \ contains=LRATPrefix,TraceIdentifier,TraceZero
syntax match LRATPrefix              /^\s*\d\+/
            \ contained contains=TraceIdentifier
            \ nextgroup=LRATClause
syntax match LRATClause              /\s\+\(-\?\d\+\s\+\)\{-}0/
            \ contained contains=TraceZero
            \ nextgroup=LRATIdentifierList,LRATResolventList
syntax match LRATIdentifierList      /\(\s\+\d\+\)\+/
            \ contains=TraceZero
            \ contained nextgroup=LRATResolventList
syntax match LRATResolventList       /\s\+\(-\d\+\s\+\(\d\+\s\+\)\{-}\)*0/
            \ contained contains=TraceZero

" ~~~~~~~~~~~~~~~~~~~~ Highlight ~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~ General
highlight default link TraceKeywords      Keyword
highlight default link TraceComment       Comment
highlight default link TraceIdentifier    Identifier

" ~~~~~~~~~~ Clause lines
highlight default link TraceLiteral       Normal
highlight default link TraceZero          SpecialChar

" ~~~~~~~~~~ Trace lines
highlight default link TraceSolutionType  Special

" ~~~~~~~~~~ LRAT lines
highlight default link LRATDeletionLine   Statement
highlight default link LRATClause         Normal
highlight default link LRATIdentifierList Statement
highlight default link LRATResolventList  Number

let b:current_syntax = 'trace'

