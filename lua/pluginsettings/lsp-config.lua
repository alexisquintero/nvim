return {
  'neovim/nvim-lspconfig',
  config = function()
    local servers = { "clojure_lsp", "nixd", "terraformls", "pyright", "bashls", "cmake", "dockerls", "ts_ls", "lua_ls" }
    for _, lsp in ipairs(servers) do
      vim.lsp.enable(lsp)
    end
  end
}
