local function lsp_mappings(bufnr)
  local function bufnnoremap (lhs, rhs)
    nnoremap(lhs, rhs, { noremap=true, silent=true, buffer=bufnr })
  end

  bufnnoremap('gD', vim.lsp.buf.declaration)
  bufnnoremap('K', vim.lsp.buf.hover)
  bufnnoremap('gI', require('telescope.builtin').lsp_implementations)
  bufnnoremap('<leader>k', vim.lsp.buf.signature_help)
  bufnnoremap('<leader>wa', vim.lsp.buf.add_workspace_folder)
  bufnnoremap('<leader>wr', vim.lsp.buf.remove_workspace_folder)
  bufnnoremap('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
  bufnnoremap('<leader>D', vim.lsp.buf.type_definition)
  bufnnoremap('<leader>rn', vim.lsp.buf.rename)
  bufnnoremap('<leader>ca', vim.lsp.buf.code_action)
  bufnnoremap('<space>cl', vim.lsp.codelens.run)
  bufnnoremap('gr', require('telescope.builtin').lsp_references)
  bufnnoremap('<leader>bf', vim.lsp.buf.format)
  bufnnoremap('<leader>fws', require('telescope.builtin').lsp_dynamic_workspace_symbols)
end

local function lsp_diagnostics()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      signs = false,
    }
  )
end

on_attach = function(client, bufnr)
  lsp_mappings(bufnr)
  lsp_diagnostics()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = { "clojure_lsp", "nixd", "terraformls", "pyright", "bashls", "cmake", "dockerls", "tsserver" }
for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
