return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cd build && make' },
  },
  config = function()
    local opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-m>"] = require("telescope.actions").select_default,
            ["<c-space>"] = function(prompt_bufnr)
              require("telescope.actions.generate").refine(prompt_bufnr, {
                prompt_to_prefix = true,
                sorter = false,
              })
            end,
          },
        },
        layout_strategy = 'vertical',
        layout_config = {
          vertical = {
            width = 0.95,
            height = 0.95,
            mirror = true,
            prompt_position = 'top',
            preview_height = 0.7,
          }
        },
      },
      pickers = {
        lsp_references = {
          fname_width = 300,
          trim_text = true,
        },
      },
    }
    require("telescope").setup(opts)
    require('telescope').load_extension('fzf')
    require("telescope").load_extension("ui-select")

    nnoremap('<leader>ff', require('telescope.builtin').find_files)
    nnoremap('<leader>fg', ":Telescope grep_string search=<CR>")
    nnoremap('<leader>fG', require('telescope.builtin').live_grep)
    nnoremap('<leader>fb', require('telescope.builtin').buffers)
    nnoremap('<leader>fr', ":Telescope resume<CR>")
  end
}
