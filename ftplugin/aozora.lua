local build = require('build')

local tool = 'aozora2html'
local css = vim.fn.glob(vim.fn.expand('%:p:h') .. '/*.css')
local cmd = { tool, '--use-jisx0213', '--use-unicode' }
if css ~= '' then
  table.insert(cmd, '--css-files=' .. vim.fn.fnamemodify(css, ':t'))
end

vim.bo.makeprg = table.concat(cmd, ' ') .. ' % %<.html'

if build.check_tool(tool) then
  vim.api.nvim_create_autocmd('BufWritePost', {
    buffer = 0,
    callback = function()
      local input = vim.fn.expand('%:p')
      local output = vim.fn.expand('%:p:r') .. '.html'
      vim.notify(tool .. ': building...', vim.log.levels.INFO)
      vim.system(vim.list_extend(vim.list_slice(cmd), { input, output }), { text = true }, build.notify_result(tool))
    end,
  })
end
