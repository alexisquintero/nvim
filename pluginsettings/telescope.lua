local actions = require("telescope.actions")
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-m>"] = actions.select_default
      },
    },
    path_display = { "smart" },
    file_ignore_patterns = { "node_modules/" }
  }
}

require('telescope').load_extension('fzf')

nnoremap('<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap('<leader>fg', ":Telescope grep_string search=<CR>")
nnoremap('<leader>fG', "<cmd>lua require('telescope.builtin').live_grep()<CR>")
nnoremap('<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<CR>")
nnoremap('<leader>fr', ":Telescope resume<CR>")
