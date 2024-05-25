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

nnoremap('<C-[>', '<Esc>')
nnoremap('<C-h>', '<BS>')
nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-i>', '<Tab>')
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-l>', '<C-w>l')
nnoremap('<C-m>', '<CR>')
nnoremap('<C-w><C-]>', ':horizontal winc ]<CR>')
nnoremap('<C-w>]', ':vertical winc ]<CR>')
nnoremap('[oq', ':copen<CR>')
nnoremap(']oq', ':cclose<CR>')
nnoremap('z<C-g>', '<cmd>lua vim.fn.setreg("+", string.gsub(vim.api.nvim_buf_get_name(0), vim.loop.cwd(), ""))<CR>')

-- Diagnostic
nnoremap('<leader>e', vim.diagnostic.open_float)
nnoremap('[d', vim.diagnostic.goto_prev)
nnoremap(']d', vim.diagnostic.goto_next)
nnoremap('<leader>dl', vim.diagnostic.setloclist)
nnoremap('<leader>da', vim.diagnostic.setqflist) -- all workspace diagnostics
nnoremap('<leader>de', '<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>') -- all workspace errors
nnoremap('<leader>dw', '<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>') -- all workspace warnings

tnoremap('<leader><Esc>', '<C-\\><C-n>')

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf

    local function lsp_mappings(bufnr)
      local function bufnnoremap (lhs, rhs)
        nnoremap(lhs, rhs, { noremap=true, silent=true, buffer=bufnr })
      end

      bufnnoremap('gD', vim.lsp.buf.declaration)
      bufnnoremap('gI', require('telescope.builtin').lsp_implementations)
      bufnnoremap('<leader>k', vim.lsp.buf.signature_help)
      bufnnoremap('<leader>wa', vim.lsp.buf.add_workspace_folder)
      bufnnoremap('<leader>wr', vim.lsp.buf.remove_workspace_folder)
      bufnnoremap('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
      bufnnoremap('<leader>D', vim.lsp.buf.type_definition)
      bufnnoremap('<leader>rn', vim.lsp.buf.rename)
      bufnnoremap('<leader>ca', vim.lsp.buf.code_action)
      bufnnoremap('<space>cl', vim.lsp.codelens.run)
      bufnnoremap('gr', require('telescope.builtin').lsp_references)
      bufnnoremap('<leader>bf', vim.lsp.buf.format)
      bufnnoremap('<leader>fws', require('telescope.builtin').lsp_dynamic_workspace_symbols)
    end

    lsp_mappings(bufnr)
  end,
})
