return {
  'neovim/nvim-lspconfig',
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    local servers = { "clojure_lsp", "nixd", "terraformls", "pyright", "bashls", "cmake", "dockerls", "ts_ls", "lua_ls" }
    for _, lsp in ipairs(servers) do
      require('lspconfig')[lsp].setup {
        capabilities = capabilities,
      }
    end
  end
}
