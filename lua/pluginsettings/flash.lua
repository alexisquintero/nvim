return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    search = {
      multi_window = false,
    },
    modes = {
      char = {
        enabled = false,
      },
      search = {
        enabled = true,
      }
    },
  },
}
