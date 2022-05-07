vim.g.mapleader = " "
local opts = { noremap=true }

function noremap (lhs, rhs)
  vim.api.nvim_set_keymap('', lhs, rhs, opts)
end

function nnoremap (lhs, rhs)
  vim.api.nvim_set_keymap('n', lhs, rhs, opts)
end

function tnoremap (lhs, rhs)
  vim.api.nvim_set_keymap('t', lhs, rhs, opts)
end

function _bufnnoremap (bufnr, lhs, rhs)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', lhs, rhs, { noremap=true, silent=true})
end

noremap('F12', '<Esc>:syntax sync fromstart<CR>')

nnoremap('<C-[>', '<Esc>')
nnoremap('<C-h>', '<BS>')
nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-i>', '<Tab>')
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-l>', '<C-w>l')
nnoremap('<C-m>', '<CR>')
nnoremap('[oq', ':copen<CR>')
nnoremap(']oq', ':cclose<CR>')
nnoremap('z<C-g>', ":call setreg('+', getreg('%').'#'.line('.'))<CR><C-g>")

tnoremap('<leader><Esc>', '<C-\\><C-n>')
