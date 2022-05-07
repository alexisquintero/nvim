nnoremap('<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
nnoremap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
nnoremap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
nnoremap('<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')
nnoremap('<leader>aa', '<cmd>lua vim.diagnostic.setqflist()<CR>') -- all workspace diagnostics
nnoremap('<leader>ae', '<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>') -- all workspace errors
nnoremap('<leader>aw', '<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>') -- all workspace warnings

function lsp_mappings(bufnr)
  local function bufnnoremap (lhs, rhs)
    _bufnnoremap(bufnr, lhs, rhs)
  end

  bufnnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  bufnnoremap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  bufnnoremap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  bufnnoremap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  bufnnoremap('<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  bufnnoremap('<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
  bufnnoremap('<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
  bufnnoremap('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
  bufnnoremap('<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  bufnnoremap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  bufnnoremap('<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  bufnnoremap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  bufnnoremap('<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
  bufnnoremap('gs', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  bufnnoremap('gws', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
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
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = { "clojure_lsp", "hls", "rnix" }
for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
