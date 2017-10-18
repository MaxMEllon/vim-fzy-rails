let s:is_windows = has('win32') || has('win64')
let s:is_cygwin = has('win32unix')

function! IsMac()
  return !s:is_windows && !s:is_cygwin
        \ && (has('mac') || has('macunix') || has('gui_macvim') ||
        \   (!executable('xdg-open') &&
        \     system('uname') =~? '^darwin'))
endfunction

function! Emulate_RETURN_KEY()
  if IsMac()
    return 'osascript -e ''tell application "System Events" to keystroke "M" using {control down}'''
  else
    return 'xte ''keydown Return'''
  endif
endfunction
