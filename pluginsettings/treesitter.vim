lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = { enable = false }, -- colorscheme "fails"
  incremental_selection = { enable = true },
  textobjects = { enable = true },
  indent = { enable = true },
}
EOF
