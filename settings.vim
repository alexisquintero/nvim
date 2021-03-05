set colorcolumn=120
set expandtab
set foldlevelstart=1
set foldmethod=indent
set hidden
set ignorecase
set laststatus=0
set list listchars+=tab:>-
set noshowmode
set omnifunc=syntaxcomplete#Complete
set scrolloff=3
set shiftwidth=2
set sidescrolloff=3
set smartcase
set softtabstop=2
set splitbelow
set splitright
set termguicolors
set updatetime=300
set wildmode=list:longest,full

set rulerformat+=%=                   " Right align
set rulerformat+=%{coc#status()}      " Coc status
set rulerformat+=%(\ %l,%c%V%)\ %P    " Default~ rulerformat

if has('nvim-0.3.2') || has("patch-8.1.0360")
  set diffopt=filler,internal,algorithm:histogram,indent-heuristic
endif

if has('nvim')
  set inccommand=nosplit
endif
