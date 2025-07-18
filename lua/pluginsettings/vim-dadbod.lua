return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    {
      'kristijanhusak/vim-dadbod-completion',
      ft = { 'sql', 'mysql', 'plsql', 'db', 'duckdb', 'ddb' },
      lazy = true,
      init = function()
        vim.opt_local.omnifunc = 'vim_dadbod_completion#omni'
      end
    },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}
