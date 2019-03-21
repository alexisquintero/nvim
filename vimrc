filetype plugin indent on
syntax on

runtime macros/mathchit.vim

silent !mkdir ~/.vim/private           > /dev/null 2>&1
silent !mkdir ~/.vim/private/directory > /dev/null 2>&1
silent !mkdir ~/.vim/private/undo      > /dev/null 2>&1

set autoindent
set backspace=indent,eol,start
set colorcolumn=120
set cursorline
set directory=~/.vim/private/directory//
set expandtab
set fileencoding=utf-8
set foldlevelstart=1
set gdefault
set hidden
set ignorecase
set incsearch
set list listchars=tab:>-,trail:·
set nobackup
set noequalalways
set noshowmode
set notagrelative
set number
set omnifunc=syntaxcomplete#Complete
set ruler
set scrolloff=5
set shiftwidth=2
set showcmd
set showmatch
set sidescrolloff=3
set smartcase
set softtabstop=2
set splitbelow
set splitright
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set tagcase=smart
set tags=.git/tags
set termguicolors
set undodir=~/.vim/private/undo//
set undofile
set updatetime=100
set wildmenu
set wildmode=list:longest
set wrapscan

if has('nvim')
  set inccommand=nosplit
endif

au FocusGained * :checktime

let mapleader = "\<Space>"

nnoremap <C-]> <C-]>zz
nnoremap <C-e> 5<C-e>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-p> :Files<CR>
nnoremap <C-t> <C-t>zz
nnoremap <C-y> 5<C-y>
nnoremap <Leader>* :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <M-p> :Ag<CR>
nnoremap <SPACE> <Nop>
nnoremap <leader>F :let @+=@%<CR>
nnoremap <leader>Q :pclose<CR>
nnoremap <leader>bC :exe ':silent !chromium-browser %'<CR>
nnoremap <leader>bc :exe ':silent !google-chrome %'<CR>
nnoremap <leader>bf :exe ':silent !firefox %'<CR>
nnoremap <leader>bo :exe ':silent !opera %'<CR>
nnoremap <leader>f :let @+=expand('%:t')<CR>
nnoremap <leader>q :ptjump <C-r><C-w><CR>
nnoremap <silent><C-n> :noh<CR>
nnoremap @ :x<CR>
nnoremap N Nzzzv
nnoremap Q @
nnoremap Y y$
nnoremap ]h :try<bar>lprev<bar>catch /^Vim\%((\a\+)\)\=:E\%(553\<bar>42\):/<bar>llast<bar>endtry<cr>
nnoremap ]l :try<bar>lnext<bar>catch /^Vim\%((\a\+)\)\=:E\%(553\<bar>42\):/<bar>lfirst<bar>endtry<cr>
nnoremap gb :Buffers<CR>
nnoremap j gj
nnoremap k gk
nnoremap n nzzzv

cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-g> <C-c>
cnoremap <C-n> <Down>
cnoremap <C-o> <CR>
cnoremap <C-p> <Up>
cnoremap <C-y> <C-r>*
cnoremap sudow w !sudo tee % >/dev/null

tnoremap <Esc> <C-\><C-n>

nnoremap <leader>+ :!ctags -R -f ./.git/tags .<CR>
