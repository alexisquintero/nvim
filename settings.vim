set autoindent
set backspace=indent,eol,start
set colorcolumn=120
set directory=~/.vim/private/directory//
set equalalways
set expandtab
set fileencoding=utf-8
set foldlevelstart=1
set foldmethod=indent
set formatoptions+=j
set formatoptions-=ro
set hidden
set ignorecase
set incsearch
set laststatus=0
set list listchars=tab:>-,trail:·
set matchpairs+=<:>
set noequalalways
set noshowmode
set notagrelative
set omnifunc=syntaxcomplete#Complete
set scrolloff=3
set shiftwidth=2
set showcmd
set sidescrolloff=3
set smartcase
set softtabstop=2
set spelllang=en_us
set splitbelow
set splitright
set tagcase=smart
set tags=.git/tags
set termguicolors
set undodir=~/.vim/private/undo//
set undofile
set updatetime=300
set wildmenu
set wildmode=list:longest,full
set wrapscan

if has('nvim-0.3.2') || has("patch-8.1.0360")
    set diffopt=filler,internal,algorithm:histogram,indent-heuristic
endif

if has('nvim')
  set inccommand=nosplit
endif
