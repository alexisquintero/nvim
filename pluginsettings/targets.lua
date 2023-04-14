-- switch b back to the Vim default behavior https://github.com/wellle/targets.vim#targetsmappingsextend

vim.api.nvim_create_autocmd("User", {
  group = vim.api.nvim_create_augroup("targets_default", { clear = true }),
  pattern = "targets#mappings#user",
  command = [[
    call targets#mappings#extend({ 'b': {'pair': [{'o':'(', 'c':')'}]} })
  ]]
})
