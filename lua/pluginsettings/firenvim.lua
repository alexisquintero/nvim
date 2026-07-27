return {
  'glacambre/firenvim',

  -- Lazy load firenvim
  -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
  lazy = not vim.g.started_by_firenvim,
  build = ":call firenvim#install(0)",

  -- Never take over elements automatically. Trigger manually with <C-e>.
  init = function()
    vim.g.firenvim_config = {
      localSettings = {
        [".*"] = { takeover = "never", priority = 0 },
      },
    }
  end,
}

