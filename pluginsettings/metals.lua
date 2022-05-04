local on_attach = function(_, bufnr)
  local opts = { noremap=true, silent=true }
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  lsp_mappings(bufnr)

  buf_set_keymap('n', '<leader>ws', '<cmd>lua require"metals".worksheet_hover()<CR>', opts)

  lsp_diagnostics()
end

metals_config = require('metals').bare_config()
metals_config.settings = {
  showImplicitArguments = true,
  useGlobalExecutable = true,
}
metals_config.on_attach = on_attach

vim.opt_global.completeopt = { "menu", "noinsert", "noselect" }
vim.opt_global.shortmess:remove("F"):append("c")

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require('metals').initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
