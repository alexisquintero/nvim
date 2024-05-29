return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects'
  },
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      highlight = {
        enable = true,
      },
      indent = {
        enable = true
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          node_incremental = "v",
          node_decremental = "V",
        },
      },
      textobjects = { -- https://github.com/gennaro-tedesco/dotfiles/blob/b18fd749d6eb17fc4a57ea09cb074b9a203b1e28/nvim/lua/plugins/treesitter.lua#L25-L64
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = { query = "@function.outer", desc = "select around function" },
            ["if"] = { query = "@function.inner", desc = "select inside function" },
            ["ac"] = { query = "@class.outer", desc = "select around class" },
            ["ic"] = { query = "@class.inner", desc = "select inside class" },
            ["al"] = { query = "@loop.outer", desc = "select around loop" },
            ["il"] = { query = "@loop.inner", desc = "select inside loop" },
            ["ab"] = { query = "@block.outer", desc = "select around block" },
            ["ib"] = { query = "@block.inner", desc = "select inside block" },
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = { query = "@function.outer", desc = "go to next function" },
            ["]]"] = { query = "@class.outer", desc = "go to next class start" }
          },
          goto_next_end = {
            ["]M"] = { query = "@function.outer", desc = "go to next function end" },
            ["]["] = { query = "@class.outer", desc = "go to next class end" },
          },
          goto_previous_start = {
            ["[m"] = { query = "@function.outer", desc = "go to previous function" },
            ["[["] = { query = "@class.outer", desc = "go to previous class" },
          },
          goto_previous_end = {
            ["[M"] = { query = "@function.outer", desc = "go to previoous function end" },
            ["[]"] = { query = "@class.outer", desc = "go to previous class end" },
          },
        },
      },
    })
  end
}
