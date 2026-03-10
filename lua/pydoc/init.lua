local M = {}

local default_config = {
  keymaps = {
    close = 'q',
  },
  win_height = 25,
  pydoc_cmd = 'pydoc3',
}

M._config = default_config

M.setup = function(opts)
  opts = opts or {}
  M._config = vim.tbl_deep_extend('force', default_config, opts)
end

M.open_pydoc = function(search)
  require('pydoc.pydoc').open_pydoc(search, M._config)
end

M.close_pydoc = function()
  require('pydoc.pydoc').close_pydoc()
end

return M
