vim.g.mapleader = " "
local opts = { noremap=true }

vim.api.nvim_set_keymap('n', 'F12', '<Esc>:syntax sync fromstart<CR>', opts)

vim.api.nvim_set_keymap('n', 'F12', '<Esc>:syntax sync fromstart<CR>', opts)

vim.api.nvim_set_keymap('n', '<C-[>', '<Esc>', opts)
vim.api.nvim_set_keymap('n', '<C-h>', '<BS>', opts)
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opts)
vim.api.nvim_set_keymap('n', '<C-i>', '<Tab>', opts)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opts)
vim.api.nvim_set_keymap('n', '<C-m>', '<CR>', opts)
vim.api.nvim_set_keymap('n', '[oq', ':copen<CR>', opts)
vim.api.nvim_set_keymap('n', ']oq', ':cclose<CR>', opts)
vim.api.nvim_set_keymap('n', 'z<C-g>', ":call setreg('+', getreg('%').'#'.line('.'))<CR><C-g>", opts)

vim.api.nvim_set_keymap('t', '<leader><Esc>', '<C-\\><C-n>', opts)
