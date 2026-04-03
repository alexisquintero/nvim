return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  init = function()
    -- Disable entire built-in ftplugin mappings to avoid conflicts.
    -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
    vim.g.no_plugin_maps = true
  end,
  config = function()
    local sel = require("nvim-treesitter-textobjects.select")

    vim.keymap.set({ "x", "o" }, "af", function() sel.select_textobject("@function.outer", "textobjects") end, { desc = "select around function" })
    vim.keymap.set({ "x", "o" }, "if", function() sel.select_textobject("@function.inner", "textobjects") end, { desc = "select inside function" })
    vim.keymap.set({ "x", "o" }, "aC", function() sel.select_textobject("@class.outer", "textobjects") end, { desc = "select around class" })
    vim.keymap.set({ "x", "o" }, "iC", function() sel.select_textobject("@class.inner", "textobjects") end, { desc = "select inside class" })
    vim.keymap.set({ "x", "o" }, "al", function() sel.select_textobject("@loop.outer", "textobjects") end, { desc = "select around loop" })
    vim.keymap.set({ "x", "o" }, "il", function() sel.select_textobject("@loop.inner", "textobjects") end, { desc = "select inside loop" })
    vim.keymap.set({ "x", "o" }, "ab", function() sel.select_textobject("@block.outer", "textobjects") end, { desc = "select around block" })
    vim.keymap.set({ "x", "o" }, "ib", function() sel.select_textobject("@block.inner", "textobjects") end, { desc = "select inside block" })
    vim.keymap.set({ "x", "o" }, "ac", function() sel.select_textobject("@conditional.outer", "textobjects") end, { desc = "select around conditional" })
    vim.keymap.set({ "x", "o" }, "ic", function() sel.select_textobject("@conditional.inner", "textobjects") end, { desc = "select inside conditional" })

    local mov = require("nvim-treesitter-textobjects.move")

    vim.keymap.set({ "n", "x", "o" }, "]m", function() mov.goto_next_start("@function.outer", "textobjects") end, { desc = "go to next function" })
    vim.keymap.set({ "n", "x", "o" }, "[m", function() mov.goto_previous_start("@function.outer", "textobjects") end, { desc = "go to previous function" })
    vim.keymap.set({ "n", "x", "o" }, "]]", function() mov.goto_next_start("@class.outer", "textobjects") end, { desc = "go to next class" })
    vim.keymap.set({ "n", "x", "o" }, "[[", function() mov.goto_previous_start("@class.outer", "textobjects") end, { desc = "go to previous class" })
  end,
}
