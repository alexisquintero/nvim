nnoremap('<leader>e', vim.diagnostic.open_float)
nnoremap('[d', vim.diagnostic.goto_prev)
nnoremap(']d', vim.diagnostic.goto_next)
nnoremap('<leader>q', vim.diagnostic.setloclist)
nnoremap('<leader>aa', vim.diagnostic.setqflist) -- all workspace diagnostics
nnoremap('<leader>ae', '<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>') -- all workspace errors
nnoremap('<leader>aw', '<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>') -- all workspace warnings

function lsp_mappings(bufnr)
  local function bufnnoremap (lhs, rhs)
    nnoremap(lhs, rhs, { noremap=true, silent=true, buffer=bufnr })
  end

  bufnnoremap('gD', vim.lsp.buf.declaration)
  bufnnoremap('gd', vim.lsp.buf.definition)
  bufnnoremap('K', vim.lsp.buf.hover)
  bufnnoremap('gI', vim.lsp.buf.implementation)
  bufnnoremap('<leader>k', vim.lsp.buf.signature_help)
  bufnnoremap('<leader>wa', vim.lsp.buf.add_workspace_folder)
  bufnnoremap('<leader>wr', vim.lsp.buf.remove_workspace_folder)
  bufnnoremap('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
  bufnnoremap('<leader>D', vim.lsp.buf.type_definition)
  bufnnoremap('<leader>rn', vim.lsp.buf.rename)
  bufnnoremap('<leader>ca', vim.lsp.buf.code_action)
  bufnnoremap('gr', vim.lsp.buf.references)
  bufnnoremap('<leader>f', vim.lsp.buf.format)
  bufnnoremap('gs', vim.lsp.buf.document_symbol)
  bufnnoremap('gws', vim.lsp.buf.workspace_symbol)
end

function lsp_diagnostics()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      signs = false,
    }
  )
end

local on_attach = function(client, bufnr)
  lsp_mappings(bufnr)
  lsp_diagnostics()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = { "clojure_lsp", "hls", "rnix", "terraformls", "pyright", "rust_analyzer" }
for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
