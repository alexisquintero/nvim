nnoremap <C-p> :Files<CR>
nnoremap <M-p> :Rg<CR>
nnoremap gb :Buffers<CR>

command! -bang -nargs=* Rg2
      \ call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \ fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

let g:fzf_history_dir = $HOME.'/.config/nvim/private/fzf-history'
