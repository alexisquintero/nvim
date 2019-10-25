let mapleader = "\<Space>"

nnoremap <C-g> :let @+=@%<CR><C-g>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <SPACE> <Nop>
nnoremap <leader>Q :pclose<CR>
nnoremap <leader>bC :exe ':silent !chromium-browser %'<CR>
nnoremap <leader>bc :exe ':silent !google-chrome %'<CR>
nnoremap <leader>bf :exe ':silent !firefox %'<CR>
nnoremap <leader>bo :exe ':silent !opera %'<CR>
nnoremap Y y$

cnoremap sudow w !sudo tee % >/dev/null

tnoremap <leader><Esc> <C-\><C-n>
tnoremap <C-j> <CR>
