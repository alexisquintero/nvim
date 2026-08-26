return {
  'saghen/blink.cmp',
  version = '*',
  opts = {
    keymap = { preset = 'default' },
    sources = {
      default = { 'lazydev', 'lsp', 'path', 'buffer' },
      providers = {
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 100,
        },
      },
    },
  },
}
