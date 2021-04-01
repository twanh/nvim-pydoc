-- Shows pydoc like the :help menu 
local winnr, bufnr

local function close_pydoc()
  vim.api.nvim_buf_delete(bufnr, {force = true})
end
  

local function open_pydoc(search)
  -- Get the pydoc output
  local result = vim.fn.systemlist('pydoc3 ' .. search) 
  -- Split a new widow
  vim.api.nvim_command('split new') 
  -- Set the window height
  vim.api.nvim_win_set_height(0, 30) 
  -- Get the window and buf numbers 
  winnr = vim.api.nvim_tabpage_get_win(0) 
  auto_open_buf = vim.api.nvim_win_get_buf(0)
  bufnr = vim.api.nvim_create_buf(false, true)

  -- Set the pydoc buf to the new window 
  vim.api.nvim_win_set_buf(winnr, bufnr)
  -- Set the title and write the outpyt of the pydoc command to the buffer
  vim.api.nvim_buf_set_name(bufnr, "PYDOC") 
  vim.api.nvim_buf_set_lines(bufnr, 0, 1, false, result)
  -- Set q to close the window
  vim.api.nvim_buf_set_keymap(
    bufnr,
    'n',
    'q',
    ':lua require"pydoc".close_pydoc()<cr>',
    {
      nowait = true,
      noremap = true,
      silent = true,
    }
  )
  vim.api.nvim_buf_set_option(bufnr, 'modifiable', false)
  vim.api.nvim_buf_set_option(bufnr, 'readonly', true)
  --  Delete the buffer on close
  vim.api.nvim_buf_set_option(bufnr, 'bufhidden', 'wipe')
  -- Delete the buffer what was automatically created with the new window
  vim.api.nvim_buf_delete(auto_open_buf, {force=true})
end

return {
  open_pydoc = open_pydoc,
  close_pydoc = close_pydoc
}
