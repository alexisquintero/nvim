local M = {}

function M.check_tool(tool)
  if vim.fn.executable(tool) == 0 then
    vim.notify(tool .. ' not in PATH', vim.log.levels.WARN)
    return false
  end
  return true
end

function M.notify_result(tool)
  return vim.schedule_wrap(function(result)
    if result.code == 0 then
      vim.notify(tool .. ': done', vim.log.levels.INFO)
    else
      vim.notify(tool .. ': error\n' .. (result.stderr or ''), vim.log.levels.ERROR)
    end
  end)
end

return M
