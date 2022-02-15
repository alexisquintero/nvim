let g:loaded_python_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_node_provider = 0

runtime settings.vim
runtime mappings.vim
if !exists("g:ignore_plug")
  runtime plugins.vim
endif

colorscheme substrata

runtime pluginsettings/clojure.vim
runtime pluginsettings/cmp.vim
runtime pluginsettings/comment-nvim.vim
runtime pluginsettings/fidget.vim
runtime pluginsettings/fzf.vim
runtime pluginsettings/gitgutter.vim
runtime pluginsettings/lsp-config.vim
runtime pluginsettings/luasnip.vim
runtime pluginsettings/metals.vim
runtime pluginsettings/netrw.vim
runtime pluginsettings/sandwich.vim
runtime pluginsettings/sexp.vim
runtime pluginsettings/targets.vim
runtime pluginsettings/treesitter.vim
runtime pluginsettings/vim-cool.vim
runtime pluginsettings/vim-printer.vim
runtime pluginsettings/vim-scala.vim
