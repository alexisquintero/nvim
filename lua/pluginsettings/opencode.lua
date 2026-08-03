-- Default keymaps (prefix <leader>o):
--   <leader>og  toggle opencode window (open/close)
--   <leader>oy  add visual selection to context (visual mode)
--   <leader>oi  open input window (current session)
--   <leader>oo  open output window
--   <leader>o/  quick chat with selection/current line
--   <C-c>       cancel a running request (in opencode window)
return {
  "sudo-tee/opencode.nvim",
  cond = function() return vim.fn.executable('opencode') == 1 end,
  config = function()
    require("opencode").setup({
      preferred_picker = "telescope",
    })
  end,
  dependencies = {
    "OXY2DEV/markview.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
