vim.g.netrw_banner = 0
-- vim.g.netrw_list_hide = vim.cmd [[ netrw_gitignore#Hide() . '\(^\|\s\s\)\zs\.\S\+' ]]
vim.g.netrw_list_hide = (vim.fn["netrw_gitignore#Hide"]()) .. [[,\(^\|\s\s\)\zs\.\S\+]]
