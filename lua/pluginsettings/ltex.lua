require'ltex-ls'.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  use_spellfile = false,
  filetypes = { "bibtex", "context", "context.tex", "html", "latex", "markdown", "org", "restructuredtext", "rsweave" },
  settings = {
    ltex = {
      diagnosticSeverity = "information",
      sentenceCacheSize = 2000,
      additionalRules = {
        enablePickyRules = true,
        motherTongue = "es-AR",
      },
    },
  },
}
