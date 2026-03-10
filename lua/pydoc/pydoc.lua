local M = {}

local bufnr = nil
local auto_open_buf = nil

local function detect_highlights(result)
  local heading_match = '%u*'
  local detected = {}

  for k, v in ipairs(result) do
    if #string.match(v, heading_match) > 0 then
      table.insert(detected, {
        line = k - 1,
        cols = { 0, -1 },
        highlight = 'PydocHeader',
      })
    end
  end

  return detected
end

M.close_pydoc = function()
  if bufnr and vim.api.nvim_buf_is_valid(bufnr) then
    vim.api.nvim_buf_delete(bufnr, { force = true })
  end
  bufnr = nil
  auto_open_buf = nil
end

M.open_pydoc = function(search, config)
  local pydoc_cmd = vim.g.nvim_pydoc_command or config.pydoc_cmd or 'pydoc3'

  local result = vim.fn.systemlist(pydoc_cmd .. ' ' .. search)
  local result_len = #result

  vim.cmd('new')

  local win_height = config.win_height
  if result_len < win_height then
    win_height = result_len
  end

  vim.api.nvim_win_set_height(0, win_height)

  local winnr = vim.api.nvim_tabpage_get_win(0)
  auto_open_buf = vim.api.nvim_win_get_buf(0)
  bufnr = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_win_set_buf(winnr, bufnr)

  vim.api.nvim_buf_set_name(bufnr, 'PYDOC')
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, result)

  local highlights = detect_highlights(result)
  for _, v in ipairs(highlights) do
    vim.api.nvim_buf_add_highlight(
      bufnr,
      -1,
      v.highlight,
      v.line,
      v.cols[1],
      v.cols[2]
    )
  end

  if config.keymaps.close then
    vim.keymap.set('n', config.keymaps.close, function()
      M.close_pydoc()
    end, {
      buffer = bufnr,
      nowait = true,
      noremap = true,
      silent = true,
      desc = 'Close pydoc',
    })
  end

  vim.keymap.set('n', '<Plug>(PydocClose)', function()
    M.close_pydoc()
  end, {
    buffer = bufnr,
    nowait = true,
    silent = true,
    desc = 'Close pydoc (user-mappable)',
  })

  vim.bo[bufnr].modifiable = false
  vim.bo[bufnr].readonly = true
  vim.bo[bufnr].bufhidden = 'wipe'
  vim.bo[bufnr].filetype = 'pydoc'

  if auto_open_buf and vim.api.nvim_buf_is_valid(auto_open_buf) then
    vim.api.nvim_buf_delete(auto_open_buf, { force = true })
  end
end

return M
