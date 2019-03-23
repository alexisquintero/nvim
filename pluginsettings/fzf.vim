let $FZF_DEFAULT_COMMAND = 'ag -g ""'

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

let g:fzf_history_dir = '~/.vim/private/fzf-history'
