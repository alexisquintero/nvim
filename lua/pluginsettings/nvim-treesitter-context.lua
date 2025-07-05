return {
  'nvim-treesitter/nvim-treesitter-context',
  config = function()
    local config = require'treesitter-context'

    config.setup({
      enable = true,
    })
  end
}
