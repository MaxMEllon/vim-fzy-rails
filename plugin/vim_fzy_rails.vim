" Version: 0.1.0
" Author:  maxmellon
" License: MIT License

if exists('g:loaded_vim_fzy_rails')
  finish
endif

let g:loaded_vim_fzy_rails = 1

let s:save_cpo = &cpo
set cpo&vim

nnoremap <Plug>(vim-fzy-rails_controllers) :<C-u>call fzy#rails#controllers()<CR>
nnoremap <Plug>(vim-fzy-rails_models)      :<C-u>call fzy#rails#models()<CR>
nnoremap <Plug>(vim-fzy-rails_views)       :<C-u>call fzy#rails#views()<CR>
nnoremap <Plug>(vim-fzy-rails_serializers) :<C-u>call fzy#rails#serializers()<CR>
nnoremap <Plug>(vim-fzy-rails_decorators)  :<C-u>call fzy#rails#decorators()<CR>
nnoremap <Plug>(vim-fzy-rails_packs)       :<C-u>call fzy#rails#packs()<CR>
nnoremap <Plug>(vim-fzy-rails_javascripts) :<C-u>call fzy#rails#javascripts()<CR>
nnoremap <Plug>(vim-fzy-rails_stylesheets) :<C-u>call fzy#rails#stylesheets()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
