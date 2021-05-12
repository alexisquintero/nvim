set colorcolumn=120
set diffopt=filler,internal,algorithm:histogram,indent-heuristic
set expandtab
set foldmethod=indent
set hidden
set ignorecase
set inccommand=nosplit
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

function! LspStatus() abort
  let sl = ''
  if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))')
    let errors = luaeval("vim.lsp.diagnostic.get_count(0, [[Error]])")
    let warnings = luaeval("vim.lsp.diagnostic.get_count(0, [[Warning]])")
    if (errors > 0)
      let sl.='E:'
      let sl.=errors
    endif
    if (warnings > 0)
      let sl.=' W:'
      let sl.=warnings
    endif
  endif
  return sl
endfunction

set rulerformat=
set rulerformat+=%=                  " Right align
set rulerformat+=%{LspStatus()}      " LspStatus
set rulerformat+=%(\ %l,%c%V%)\ %P   " Default~ rulerformat
