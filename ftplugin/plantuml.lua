vim.bo.makeprg = 'plantuml %'

local function check_makeprg()
  local tool = vim.fn.split(vim.bo.makeprg)[1]
  if vim.fn.executable(tool) == 0 then
    vim.notify(tool .. ' not in PATH', vim.log.levels.WARN)
    return false
  end
  return true
end

local function notify_result(tool)
  return vim.schedule_wrap(function(result)
    if result.code == 0 then
      vim.notify(tool .. ': done', vim.log.levels.INFO)
    else
      vim.notify(tool .. ': error\n' .. (result.stderr or ''), vim.log.levels.ERROR)
    end
  end)
end

check_makeprg()

vim.api.nvim_create_autocmd('BufWritePost', {
  buffer = 0,
  callback = function()
    if not check_makeprg() then return end
    local cmd = vim.fn.split(vim.fn.expandcmd(vim.bo.makeprg))
    vim.notify(cmd[1] .. ': building...', vim.log.levels.INFO)
    vim.system(cmd, { text = true }, notify_result(cmd[1]))
  end,
})
