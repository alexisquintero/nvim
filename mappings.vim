let mapleader = "\<Space>"

nnoremap <C-g> :call setreg('+', getreg('%')."#".line('.'))<CR><C-g>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <SPACE> <Nop>
nnoremap Y y$

cnoremap sudow w !sudo tee % >/dev/null

tnoremap <leader><Esc> <C-\><C-n>
