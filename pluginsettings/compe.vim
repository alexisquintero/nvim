lua << EOF
require'compe'.setup {
  enabled = true;
  source = {
    path = true;
    buffer = true;
    -- calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    -- vsnip = true;
  };
}
EOF

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

highlight link CompeDocumentation NormalFloat
