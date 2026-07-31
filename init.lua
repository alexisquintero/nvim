vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

require('settings')
require('mappings')
pcall(require, 'nix_config')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("pluginsettings")

vim.api.nvim_create_autocmd('User', {
  pattern = 'LazyDone',
  once = true,
  callback = function() vim.cmd('restart') end,
})

vim.g.netrw_banner = 0
-- vim.g.netrw_list_hide = vim.cmd [[ netrw_gitignore#Hide() . '\(^\|\s\s\)\zs\.\S\+' ]]
vim.g.netrw_list_hide = (vim.fn["netrw_gitignore#Hide"]()) .. [[,\(^\|\s\s\)\zs\.\S\+]]
