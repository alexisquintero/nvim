vim.opt.colorcolumn = '120'
vim.opt.diffopt = { 'filler', 'internal', 'algorithm:histogram', 'indent-heuristic' }
vim.opt.expandtab = true
vim.opt.foldmethod = 'indent'
vim.opt.ignorecase = true
vim.opt.laststatus = 0
vim.opt.listchars = { tab = '>-', trail = '·'}
vim.opt.list = true
vim.opt.showmode = false
vim.opt.scrolloff = 3
vim.opt.shiftwidth = 2
vim.opt.sidescrolloff = 3
vim.opt.smartcase = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.wildmode = 'list:longest,full'

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

vim.opt.rulerformat = "%=" .. "%{v:lua.lsp_status()}" .. "%( %l,%c%V%) %P"
--             Right align .. LspStatus               .. Default~ rulerformat
