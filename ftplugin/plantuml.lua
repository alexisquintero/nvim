local build = require('build')

vim.bo.makeprg = 'plantuml %'

build.check_tool('plantuml')

vim.api.nvim_create_autocmd('BufWritePost', {
  buffer = 0,
  callback = function()
    if not build.check_tool('plantuml') then return end
    local cmd = vim.fn.split(vim.fn.expandcmd(vim.bo.makeprg))
    vim.notify(cmd[1] .. ': building...', vim.log.levels.INFO)
    vim.system(cmd, { text = true }, build.notify_result(cmd[1]))
  end,
})
