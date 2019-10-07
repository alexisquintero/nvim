let $FZF_DEFAULT_COMMAND = 'ag -g ""'

nnoremap <C-p> :Files<CR>
nnoremap <M-p> :Ag<CR>
nnoremap gb :Buffers<CR>

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

let g:fzf_history_dir = '~/.vim/private/fzf-history'
