-- Default keymaps (prefix <leader>o):
--   <leader>og  toggle opencode window (open/close)
--   <leader>oy  add visual selection to context (visual mode)
--   <leader>oi  open input window (current session)
--   <leader>oo  open output window
--   <leader>o/  quick chat with selection/current line
--   <C-c>       cancel a running request (in opencode window)
return {
  "sudo-tee/opencode.nvim",
  config = function()
    require("opencode").setup({
      preferred_picker = "telescope",
    })
  end,
  dependencies = {
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        anti_conceal = { enabled = false },
        file_types = { "markdown", "opencode_output" },
      },
      ft = { "markdown", "opencode_output" },
    },
    "nvim-telescope/telescope.nvim",
  },
}
