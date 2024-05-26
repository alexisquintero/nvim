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

-- disable semantic highlighting for the time being
vim.api.nvim_create_autocmd("LspAttach", { callback = function(args) local client = vim.lsp.get_client_by_id(args.data.client_id) client.server_capabilities.semanticTokensProvider = nil end, })

function _G.lsp_status()
  local sl = ""
  if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
    local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    if errors > 0 then
      sl = sl .. "E:" .. errors
    end
    if warnings > 0 then
      sl = sl .. " W:" .. warnings
    end
  end
  return sl
end

vim.o.rulerformat = "%=" .. "%{v:lua.lsp_status()}" .. "%( %l,%c%V%) %P"
--           Right align .. LspStatus               .. Default~ rulerformat

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = false,
  }
)
