require('telescope').load_extension('fzf')

nnoremap('<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap('<leader>fg', ":Telescope grep_string search=")
nnoremap('<leader>fG', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nnoremap('<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>")
