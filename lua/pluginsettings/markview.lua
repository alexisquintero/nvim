return {
    "OXY2DEV/markview.nvim",
    lazy = false,

   -- For `nvim-treesitter` users.
    priority = 49,
    config = function()
        require("markview").setup({
            preview = {
                ignore_buftypes = {},
            },
        })
        table.insert(require("markview.spec").config.preview.filetypes, "opencode_output")
    end,
};
