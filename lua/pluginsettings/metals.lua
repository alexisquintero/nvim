return {
  "scalameta/nvim-metals", -- TODO: set up the other mappings, probably different on lsp_config
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  ft = { "scala", "sbt", "java" },

  opts = function()
    local metals_config = require("metals").bare_config()
    metals_config.on_attach = function(_, bufnr)
      require("metals").setup_dap()

      local function bufnnoremap (lhs, rhs)
        nnoremap(lhs, rhs, { noremap=true, silent=true, buffer=bufnr })
      end

      bufnnoremap('<leader>ws', require("metals").hover_worksheet)
      bufnnoremap('<leader>fM', require('telescope').extensions.metals.commands)
    end

    metals_config.settings = {
      showImplicitArguments = true,
      useGlobalExecutable = true,
      showImplicitConversionsAndClasses = true,
      showInferredType = true,
    }

    metals_config.init_options.statusBarProvider = "off"

    return metals_config
  end,

  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = self.ft,
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end
}
