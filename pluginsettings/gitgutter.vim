let g:gitgutter_map_keys = 0
let g:gitgutter_signs = 0

nmap [h <Plug>(GitGutterPrevHunk)
nmap ]h <Plug>(GitGutterNextHunk)
nmap <leader>ht :GitGutterSignsToggle
nmap <leader>hp :GitGutterPreviewHunk<CR>
