return {
  'nvim-treesitter/nvim-treesitter-context',
  config = function()
    local config = require'treesitter-context'

    config.setup({
      enable = true,
      max_lines = 5,
      min_window_height = 20,
    })
  end
}
