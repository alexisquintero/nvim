-- Always true on CI so lazy keeps cond-gated plugins in lazy-lock.json up to date
return function(exe)
  return vim.env.CI ~= nil or vim.fn.executable(exe) == 1
end
