lua << EOF
local cmd = vim.cmd

cmd([[augroup lsp]])
cmd([[autocmd!]])
cmd([[autocmd FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]])
cmd([[augroup end]])

local on_attach = function(_, bufnr)
  local opts = { noremap=true, silent=true }
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  lsp_mappings(bufnr)

  buf_set_keymap('n', '<leader>ws', '<cmd>lua require"metals".worksheet_hover()<CR>', opts)
  buf_set_keymap('n', '<leader>a', '<cmd>lua require"metals".open_all_diagnostics()<CR>', opts)

  lsp_diagnostics()
end

metals_config = require'metals'.bare_config()
metals_config.settings = {
  showImplicitArguments = true,
  useGlobalExecutable = true,
}
metals_config.on_attach = on_attach
EOF

set completeopt=menuone,noinsert,noselect
set shortmess+=c
set shortmess-=F
