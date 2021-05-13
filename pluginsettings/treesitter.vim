lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = { enable = false }, -- colorscheme "fails"
  incremental_selection = { enable = true },
  textobjects = { enable = true },
  indent = { enable = true },
  playground = { enable = true},
}
EOF

highlight! link TSFunction NONE
highlight! link TSStringEscape NONE
highlight! link TSVariableBuiltin Normal
highlight! link TSParameter Normal
highlight! link TSFuncMacro Statement
highlight! link TSType Statement
highlight! link TSFuncBuiltin Function
