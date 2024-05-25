return {
  'neovim/nvim-lspconfig',
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local servers = { "clojure_lsp", "nixd", "terraformls", "pyright", "bashls", "cmake", "dockerls", "tsserver" }
    for _, lsp in ipairs(servers) do
      require('lspconfig')[lsp].setup {
        capabilities = capabilities,
      }
    end
  end
}
