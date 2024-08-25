" Vim syntax file for QCIR
" Language: Dimacs
" Author:   Marcel Simader (marcel0simader@gmail.com)
" Date:     11.10.2023
" (c) Marcel Simader 2023

" quit when a syntax file was already loaded
if exists('b:current_syntax')
    finish
endif

" ~~~~~~~~~~~~~~~~~~~~ Syntax ~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~ General
syntax keyword QCIRKeywords   forall exists or and xor ite FORALL EXISTS OR AND XOR ITE
syntax match   QCIROperators  /,\|;\|=\|-/
syntax match   QCIRDelimiters /(\|)/
syntax match   QCIRComment    /^\s*#.*$/
            \ contains=QCIRFormatID
syntax match   QCIRFormatID   /QCIR\(-G\?\d\+\)\?\(\s\+\d\+\)\?/
            \ contained

" ~~~~~~~~~~ Declaration
syntax keyword QCIRKeywordsOutput      output OUTPUT
syntax keyword QCIRKeywordsDeclaration forall exists free FORALL EXISTS FREE
            \ contained=ALLBUT,QCIRQuantStatement
syntax match   QCIRQuantStatement
            \ /=\s*\(forall\|exists\|free\|FORALL\|EXISTS\|FREE\)/
            \ transparent contains=QCIRKeywords,QCIROperators

" ~~~~~~~~~~ Identifier
syntax match QCIRIdentifier /[_[:alnum:]]\+/

" ~~~~~~~~~~~~~~~~~~~~ Highlight ~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~ General
highlight default link QCIRKeywords   Keyword
highlight default link QCIROperators  Operator
highlight default link QCIRDelimiters Delimiter
highlight default link QCIRComment    Comment
highlight default link QCIRFormatID   SpecialComment

" ~~~~~~~~~~ Declaration
highlight default link QCIRKeywordsDeclaration Define
highlight default link QCIRKeywordsOutput      Statement

" ~~~~~~~~~~ Identifier
highlight default link QCIRIdentifier Normal

let b:current_syntax = 'qcir'

