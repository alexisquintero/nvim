vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

dofile('settings.lua')
dofile('mappings.lua')

vim.cmd [[colorscheme substrata]]

dofile('pluginsettings/lsp-config.lua') -- Has lsp mappings fn

dofile('pluginsettings/cmp.lua')
dofile('pluginsettings/comment-nvim.lua')
dofile('pluginsettings/fidget.lua')
dofile('pluginsettings/gitsigns.lua')
dofile('pluginsettings/haskell-tools.lua')
dofile('pluginsettings/luasnip.lua')
dofile('pluginsettings/metals.lua')
dofile('pluginsettings/netrw.lua')
dofile('pluginsettings/rust-tools.lua')
dofile('pluginsettings/sandwich.lua')
dofile('pluginsettings/sexp.lua')
dofile('pluginsettings/targets.lua')
dofile('pluginsettings/telescope.lua')
dofile('pluginsettings/treesitter.lua')
dofile('pluginsettings/vim-cool.lua')
dofile('pluginsettings/vim-printer.lua')
