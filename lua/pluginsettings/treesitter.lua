require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<S-CR>",
      node_incremental = "<CR>",
      scope_incremental = "<S-CR>",
      node_decremental = "<BS>",
    },
  },
  textobjects = { -- https://github.com/gennaro-tedesco/dotfiles/blob/b18fd749d6eb17fc4a57ea09cb074b9a203b1e28/nvim/lua/plugins/treesitter.lua#L25-L64
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = { query = "@function.outer", desc = "🌲select around function" },
        ["if"] = { query = "@function.inner", desc = "🌲select inside function" },
        ["ac"] = { query = "@class.outer", desc = "🌲select around class" },
        ["ic"] = { query = "@class.inner", desc = "🌲select inside class" },
        ["al"] = { query = "@loop.outer", desc = "🌲select around loop" },
        ["il"] = { query = "@loop.inner", desc = "🌲select inside loop" },
        ["ab"] = { query = "@block.outer", desc = "🌲select around block" },
        ["ib"] = { query = "@block.inner", desc = "🌲select inside block" },
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = { query = "@function.outer", desc = "🌲go to next function" },
        ["]C"] = { query = "@class.outer", desc = "🌲go to next class" },
      },
      goto_previous_start = {
        ["[m"] = { query = "@function.outer", desc = "🌲go to previous function" },
        ["[C"] = { query = "@class.outer", desc = "🌲go to previous class" },
      },
    },
    lsp_interop = {
      enable = true,
      peek_definition_code = {
        ["<leader>pf"] = { query = "@function.outer", desc = "🌲peek function definition" },
        ["<leader>pc"] = { query = "@class.outer", desc = "🌲peek class definition" },
      },
    },
  },
}
