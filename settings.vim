set backspace=indent,eol,start
set colorcolumn=120
set expandtab
set fileencoding=utf-8
set foldlevelstart=1
set foldmethod=indent
set hidden
set ignorecase
set laststatus=0
set list listchars=tab:>-,trail:·
set matchpairs+=<:>
set noshowmode
set notagrelative
set omnifunc=syntaxcomplete#Complete
set scrolloff=3
set shiftwidth=2
set sidescrolloff=3
set smartcase
set softtabstop=2
set spelllang=en_us
set splitbelow
set splitright
set tagcase=smart
set tags=.git/tags
set termguicolors
set undofile
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

let s:vim_files = $HOME."/.config/nvim/private"
let &undodir = s:vim_files."/undo//"
let &directory = s:vim_files."/directory//"

for d in [ &undodir, &directory ]
  silent exec "!mkdir -p " . d " > /dev/null 2>&1"
endfor

let &viminfofile = s:vim_files."/viminfo"
