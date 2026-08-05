return {
  'vim-skk/skkeleton',
  dependencies = { 'vim-denops/denops.vim' },
  ft = 'aozora',
  config = function()
    vim.keymap.set({ 'i', 'c' }, '<C-j>', '<Plug>(skkeleton-toggle)')
    vim.fn['skkeleton#config']({
      globalDictionaries = { { vim.g.skk_jisyo, 'euc-jp' } },
    })
  end,
}
