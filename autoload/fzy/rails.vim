scriptencoding utf-8
" Version: 0.1.0
" Author:  maxmellon
" License: MIT License

let s:save_cpo = &cpo
set cpo&vim

function! fzy#rails#controllers()
  call fzy#rails#base#call('/app/controllers')
endfunction

function! fzy#rails#models()
  call fzy#rails#base#call('/app/models')
endfunction

function! fzy#rails#views()
  call fzy#rails#base#call('/app/views')
endfunction

function! fzy#rails#serializers()
  call fzy#rails#base#call('/app/serializers')
endfunction

function! fzy#rails#decorators()
  call fzy#rails#base#call('/app/decorators')
endfunction

function! fzy#rails#packs()
  call fzy#rails#base#call('/app/javascript/packs')
endfunction

function! fzy#rails#javascripts()
  call fzy#rails#base#call('/app/assets/javascripts')
endfunction

function! fzy#rails#stylesheets()
  call fzy#rails#base#call('/app/assets/stylesheets')
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
