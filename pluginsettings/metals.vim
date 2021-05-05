lua << EOF
local cmd = vim.cmd

cmd [[augroup lsp]]
cmd [[autocmd!]]
cmd [[autocmd FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]]
cmd [[augroup end]]

metals_config = require'metals'.bare_config
EOF

let g:metals_use_global_executable = v:true

set completeopt=menuone,noinsert,noselect
set shortmess+=c
set shortmess-=F
