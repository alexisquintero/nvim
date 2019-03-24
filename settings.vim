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
set matchpairs+=<:>
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
