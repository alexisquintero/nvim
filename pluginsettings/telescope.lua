local actions = require("telescope.actions")
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-m>"] = actions.select_default,
        ["<c-space>"] = function(prompt_bufnr)
          require("telescope.actions.generate").refine(prompt_bufnr, {
            prompt_to_prefix = true,
            sorter = false,
          })
        end,
      },
    },
    path_display = { "smart" },
    file_ignore_patterns = { "node_modules/" }
  }
}

require('telescope').load_extension('fzf')

nnoremap('<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap('<leader>fg', ":Telescope grep_string search=<CR>")
nnoremap('<leader>fG', require('telescope.builtin').live_grep)
nnoremap('<leader>fb', require('telescope.builtin').buffers)
nnoremap('<leader>fr', ":Telescope resume<CR>")
