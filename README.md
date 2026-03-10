# nvim-pydoc

Shows Python documentation from the `pydoc` command in a neovim window.

![example](https://media.giphy.com/media/ZvIsb0uivq6aGaggF6/giphy.gif)

## Requirements

- Neovim 0.8+
- Python with `pydoc` installed

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
return {
  'twanh/nvim-pydoc',
  cmd = 'Pydoc',
  keys = {
    { '<leader>pd', ':Pydoc ', desc = 'Open pydoc' },
    { 'K', ':Pydoc ', desc = 'Pydoc word under cursor' },
  },
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'twanh/nvim-pydoc',
  cmd = { 'Pydoc' },
  keys = { '<leader>pd' },
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'twanh/nvim-pydoc'
```

## Usage

### Commands

```vim
:Pydoc os.path
:Pydoc json
:Pydoc collections
```

### Keybindings

The plugin provides default keybindings (lazy.nvim/packer):

| Keybinding | Action |
|------------|--------|
| `<leader>pd` | Open pydoc (prompts for module) |
| `K` | Pydoc word under cursor |

Press `q` to close the pydoc window.

## Configuration

Call `require('pydoc').setup()` in your init.lua:

```lua
require('pydoc').setup({
  -- Keybinding to close the window (use false to disable)
  keymaps = {
    close = 'q',
  },

  -- Maximum window height
  win_height = 25,

  -- Pydoc command to use (pydoc, pydoc3, pydoc3.11, etc.)
  pydoc_cmd = 'pydoc3',
})
```

### Custom Keybindings

The plugin provides `<Plug>(PydocClose)` for custom keybindings. To change the close key:

```lua
vim.keymap.set('n', '<leader>q', '<Plug>(PydocClose)', { desc = 'Close pydoc' })
```

Or completely disable the default:

```lua
require('pydoc').setup({
  keymaps = {
    close = false,
  },
})
```

## Highlights

The plugin defines these highlight groups:

- `PydocHeader` - Linked to `Title` by default
- `PydocFunction` - Linked to `Function` by default

To customize:

```lua
vim.api.nvim_set_hl(0, 'PydocHeader', { fg = '#ffaa00', bold = true })
```

## Lua API

```lua
local pydoc = require('pydoc')

-- Open pydoc for a module
pydoc.open_pydoc('os.path')

-- Close the pydoc window
pydoc.close_pydoc()

-- Configure the plugin
pydoc.setup({ win_height = 30 })
```
