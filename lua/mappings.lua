vim.g.mapleader = " "
local opts = { noremap=true }

function noremap (lhs, rhs)
  vim.keymap.set('', lhs, rhs, opts)
end

function nnoremap (lhs, rhs, _opts)
  vim.keymap.set('n', lhs, rhs, _opts or opts)
end

function tnoremap (lhs, rhs)
  vim.keymap.set('t', lhs, rhs, opts)
end

nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-l>', '<C-w>l')
nnoremap('<C-w><C-]>', ':horizontal winc ]<CR>')
nnoremap('<C-w>]', ':vertical winc ]<CR>')
nnoremap('[oq', ':copen<CR>')
nnoremap(']oq', ':cclose<CR>')
nnoremap('yow', ':set wrap!<CR>')

nnoremap('<leader>il', '<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>')

-- Diagnostic
nnoremap('<leader>dl', vim.diagnostic.setloclist)
nnoremap('<leader>da', vim.diagnostic.setqflist) -- all workspace diagnostics
nnoremap('<leader>de', '<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>') -- all workspace errors
nnoremap('<leader>dw', '<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>') -- all workspace warnings

tnoremap('<leader><Esc>', '<C-\\><C-n>')

-- Path "text objects": yip/yap (relative), yiP/yaP (absolute), a = with line/range
-- NOTE: ideally this would use a native yank so that visual mode exit and TextYankPost
-- are handled automatically, but that's only possible when yanking actual buffer text.
-- TextYankPost is NOT triggered by these mappings.
local function yank_path(absolute, with_line)
  local path = vim.api.nvim_buf_get_name(0)
  if path == '' then return end
  path = absolute and path or vim.fn.fnamemodify(path, ':.')
  if with_line then
    local s, e = vim.fn.line('v'), vim.fn.line('.')
    if s > e then s, e = e, s end
    path = s == e and path .. ':L' .. e or path .. ':L' .. s .. '-L' .. e
  end
  vim.fn.setreg('+', path)
  vim.fn.setreg('"', path)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
end

vim.keymap.set({'n','x'}, 'yip', function() yank_path(false, false) end, { noremap = true, desc = 'yank relative path' })
vim.keymap.set({'n','x'}, 'yap', function() yank_path(false, true)  end, { noremap = true, desc = 'yank relative path:line(s)' })
vim.keymap.set({'n','x'}, 'yiP', function() yank_path(true,  false) end, { noremap = true, desc = 'yank absolute path' })
vim.keymap.set({'n','x'}, 'yaP', function() yank_path(true,  true)  end, { noremap = true, desc = 'yank absolute path:line(s)' })
-- Path "text objects"

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf

    local function lsp_mappings(bufnr)
      local function bufnnoremap (lhs, rhs)
        nnoremap(lhs, rhs, { noremap=true, silent=true, buffer=bufnr })
      end

      bufnnoremap('gD', vim.lsp.buf.declaration)
      bufnnoremap('gri', require('telescope.builtin').lsp_implementations)
      bufnnoremap('<leader>wa', vim.lsp.buf.add_workspace_folder)
      bufnnoremap('<leader>wr', vim.lsp.buf.remove_workspace_folder)
      bufnnoremap('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
      bufnnoremap('<leader>D', vim.lsp.buf.type_definition)
      bufnnoremap('<space>cl', vim.lsp.codelens.run)
      bufnnoremap('grr', require('telescope.builtin').lsp_references)
      bufnnoremap('<leader>bf', vim.lsp.buf.format)
      bufnnoremap('<leader>fws', require('telescope.builtin').lsp_dynamic_workspace_symbols)
    end

    lsp_mappings(bufnr)
  end,
})


