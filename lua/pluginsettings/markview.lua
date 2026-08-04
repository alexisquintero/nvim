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
      },
    })
  end,
};
