let mapleader = "\<Space>"

noremap <F12> <Esc>:syntax sync fromstart<CR>

nnoremap <C-g> :call setreg('+', getreg('%')."#".line('.'))<CR><C-g>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <SPACE> <Nop>
nnoremap Y y$

inoremap <C-U> <C-G>u<C-U>

tnoremap <leader><Esc> <C-\><C-n>
