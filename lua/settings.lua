vim.o.cmdheight = 0
vim.o.colorcolumn = '120'
vim.opt.diffopt:append { 'linematch:60' }
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.laststatus = 0
vim.opt.listchars = { tab = '>-', trail = '·'}
vim.o.list = true
vim.o.showmode = false
vim.o.scrolloff = 3
vim.o.shiftwidth = 2
vim.o.sidescrolloff = 3
vim.o.smartcase = true
vim.o.softtabstop = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.wildmode = 'list:longest,full'
vim.o.winborder = "rounded"

require('ruler')

vim.diagnostic.config(
  {
    virtual_text = true,
    signs = false,
  }
)

-- disable semantic highlighting for the time being
vim.api.nvim_create_autocmd("LspAttach", { callback = function(args) local client = vim.lsp.get_client_by_id(args.data.client_id) client.server_capabilities.semanticTokensProvider = nil end, })

vim.o.rulerformat = "%=" .. "%(%{v:lua.vim.diagnostic.status()} %)" .. "%( %l,%c%V%) %P"
--           Right align .. DiagnosticStatus                        .. Default rulerformat
