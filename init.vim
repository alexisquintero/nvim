let g:loaded_python_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_node_provider = 0
let g:do_filetype_lua = 1
let g:did_load_filetypes = 0

runtime settings.lua
runtime mappings.lua
if !exists("g:ignore_plug")
  runtime plugins.vim
endif

colorscheme substrata

runtime pluginsettings/cmp.lua
runtime pluginsettings/comment-nvim.lua
runtime pluginsettings/fidget.lua
runtime pluginsettings/fzf.vim
runtime pluginsettings/gitgutter.vim
runtime pluginsettings/lsp-config.lua
runtime pluginsettings/luasnip.lua
runtime pluginsettings/metals.lua
runtime pluginsettings/netrw.vim
runtime pluginsettings/sandwich.vim
runtime pluginsettings/sexp.vim
runtime pluginsettings/targets.vim
runtime pluginsettings/treesitter.lua
runtime pluginsettings/vim-cool.vim
runtime pluginsettings/vim-printer.vim
