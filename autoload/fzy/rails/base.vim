scriptencoding utf-8
" Version: 0.1.0
" Author:  maxmellon
" License: MIT License

let s:save_cpo = &cpo
set cpo&vim

function! s:get_output(command)
  try
    let output = system(a:command . ' | fzy')
  catch /Vim:Interrupt/
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
  let response = system('git rev-parse --show-toplevel')
  if !v:shell_error
    return substitute(response,  "\n",  '',  'g')
  else
    return getcwd()
  endif
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

  try
    execute 'cd ' . l:app_path . a:path
    call s:base('find . -type f | cut -c 3-', l:Callback)
  catch => e
    echomsg e
  endtry

  execute 'cd ' . l:current_path
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
