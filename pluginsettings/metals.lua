local on_attach = function(_, bufnr)
  local function bufnnoremap (lhs, rhs)
    nnoremap(lhs, rhs, { noremap=true, silent=true, buffer=bufnr })
  end

  lsp_mappings(bufnr)
  bufnnoremap('<leader>ws', '<cmd>lua require"metals".worksheet_hover()<CR>')
  lsp_diagnostics()
end

metals_config = require('metals').bare_config()
metals_config.settings = {
  showImplicitArguments = true,
  useGlobalExecutable = true,
  showImplicitConversionsAndClasses = true,
  showInferredType = true,
}

metals_config.on_attach = on_attach

local capabilities = vim.lsp.protocol.make_client_capabilities()

metals_config.capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

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
