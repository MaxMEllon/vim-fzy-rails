scriptencoding utf-8
" Version: 0.1.0
" Author:  maxmellon
" License: MIT License

let s:save_cpo = &cpo
set cpo&vim

let s:fzy_options = get(g:, 'fzy_options', '-l 30')

function s:cmd()
  return ' | fzy ' . s:fzy_options
endfunction

function! s:get_output(command)
  let l:fzy = s:cmd()
  try
    let output = system(a:command . l:fzy)
  catch /Vim:Interrupt/ => e
    echoerr e
  endtry
  redraw!
  return substitute(output, "\n", '', 'g')
endfunction

function! s:base(command, Callback)
  let output = s:get_output(a:command)
  redraw!
  if v:shell_error == 0 && !empty(output)
    call a:Callback(output)
  endif
endfunction

function! s:get_application_root_path()
  let l:path = s:get_current_path()
  let l:target = l:path
  let l:i = 0
  while l:i < len(split(l:path, '/'))
    if findfile('Gemfile', l:target) !=# ''
      return l:target
    endif
    let l:target = substitute(l:target, "/[A-Za-z-_:.]*$", '', '')
    let l:i += 1
  endwhile
  throw 'Cant find rails project'
endfunction

function! s:get_current_path()
  redir => pwd | silent pwd | redir END
  return substitute(pwd, "\n", '', 'g')
endfunction

function! s:edit(file, path)
  let l:app_path = s:get_application_root_path()
  let l:target = l:app_path . a:path . '/' . a:file
  execute 'edit ' . l:target
endfunction

function! fzy#rails#base#call(path)
  let l:current_path = s:get_current_path()
  let l:app_path = s:get_application_root_path()
  let l:Callback = { file -> s:edit(file, a:path) }
  let l:cmd = 'find . -type f | cut -c 3-'

  try
    execute 'cd ' . l:app_path . a:path
    call s:base(l:cmd, l:Callback)
  catch => e
    echoerr e
  endtry

  execute 'cd ' . l:current_path
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
