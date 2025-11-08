return {
  'neovim/nvim-lspconfig',
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    vim.lsp.config('*', {
      capabilities = capabilities,
    })

    local servers = { "clojure_lsp", "nixd", "terraformls", "pyright", "bashls", "cmake", "dockerls", "ts_ls", "lua_ls" }
    for _, lsp in ipairs(servers) do
      vim.lsp.enable(lsp)
    end
  end
}
