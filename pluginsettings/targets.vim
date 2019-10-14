" switch b back to the Vim default behavior https://github.com/wellle/targets.vim#targetsmappingsextend

autocmd User targets#mappings#user call targets#mappings#extend({
    \ 'b': {'pair': [{'o':'(', 'c':')'}]}
    \ })
