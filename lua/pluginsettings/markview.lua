return {
  "OXY2DEV/markview.nvim",
  lazy = false,

  -- For `nvim-treesitter` users.
  priority = 49,
  config = function()
    require("markview").setup({
      preview = {
        condition = function(buffer)
          return ({ opencode_output = true })[vim.bo[buffer].filetype]
        end,
        hybrid_modes = { "n", "v" },
        linewise_hybrid_mode = true,
      },
      markdown = {
        list_items = {
          marker_dot = { add_padding = false },
          marker_minus = { add_padding = false },
          marker_parenthesis = { add_padding = false },
          marker_plus = { add_padding = false },
          marker_star = { add_padding = false },
        },
      },
    })
  end,
};
