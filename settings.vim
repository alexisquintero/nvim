set autoindent
set backspace=indent,eol,start
set colorcolumn=120
set directory=~/.vim/private/directory//
set expandtab
set fileencoding=utf-8
set foldlevelstart=1
set formatoptions+=j
set hidden
set ignorecase
set incsearch
set laststatus=2
set list listchars=tab:>-,trail:·
set matchpairs+=<:>
set noequalalways
set noshowmode
set notagrelative
set number
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
set wildmode=list:longest
set wrapscan

if has('nvim-0.3.2') || has("patch-8.1.0360")
    set diffopt=filler,internal,algorithm:histogram,indent-heuristic
endif

if has('nvim')
  set inccommand=nosplit
  let g:python_host_prog="/usr/bin/python2"
  let g:python3_host_prog="/usr/bin/python3"
endif
