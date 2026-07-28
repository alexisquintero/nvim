require('vim._core.ui2').enable()

local buf, win

local function ruler_text()
  local fmt = vim.o.rulerformat:gsub('%%=', '')
  local ok, result = pcall(vim.api.nvim_eval_statusline, fmt, {
    winid = vim.api.nvim_get_current_win(),
    use_tabline = false,
  })
  return ok and result.str or ''
end

local function win_cfg(text)
  return {
    relative = 'editor',
    anchor = 'SE',
    row = vim.o.lines - vim.o.cmdheight - (vim.o.laststatus > 0 and 1 or 0),
    col = vim.o.columns,
    width = math.max(1, #text),
    height = 1,
    style = 'minimal',
    border = 'none',
    focusable = false,
    zindex = 100,
  }
end

local function init()
  buf = vim.api.nvim_create_buf(false, true)
  vim.bo[buf].bufhidden = 'hide'
  local text = ruler_text()
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { text })
  win = vim.api.nvim_open_win(buf, false, win_cfg(text))
  vim.wo[win].winhighlight = 'Normal:MsgArea'
end

local function update()
  if not (vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_win_is_valid(win)) then
    init()
    return
  end
  local text = ruler_text()
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { text })
  vim.api.nvim_win_set_config(win, { width = math.max(1, #text) })
end

local function reposition()
  if not vim.api.nvim_win_is_valid(win) then init(); return end
  local text = ruler_text()
  vim.api.nvim_win_set_config(win, win_cfg(text))
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { text })
end

local group = vim.api.nvim_create_augroup('floating_ruler', { clear = true })
vim.api.nvim_create_autocmd(
  { 'CursorMoved', 'CursorMovedI', 'BufEnter', 'WinEnter', 'ModeChanged', 'DiagnosticChanged' },
  { group = group, callback = update }
)
vim.api.nvim_create_autocmd('VimResized', { group = group, callback = reposition })

vim.schedule(init)
