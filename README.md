# Nvim Pydoc

> Still very much a work in progress 

Shows the `pydoc` documentation in a window in nvim.

![example](https://media.giphy.com/media/ZvIsb0uivq6aGaggF6/giphy.gif)

## Installing

> This plugin is build for neovim with lua support. (>0.5). Without lua support this plugin will not work!

Make sure that you have `pydoc3` installed and is on your PATH. 

Install the plugin

```lua
-- Using packer
use 'twanh/nvim-pydoc'
```
```vim
" Using vim Plug
Plug 'twanh/nvim-pydoc'
```

Or use any method you like.

## Usage

Simple execute the `:Pydoc` command with the module (of function) you want the docs on

For example: `:Pydoc os.path` 

You can quit the window simply by pressing `q` in `normal` mode. You can also quit the buffer in any way you like/are used to.

By default `pydoc3` is used to get the documentation.
You can change which version of pydoc is used by setting `vim.g.nvim_pydoc_command`
E.g.: `vim.g.nvim_pydoc_command=pydoc2`

## TODO:

- [x] Add the option to use custom path/command to pydoc (for using with `pydoc`/`pydoc3`, etc)
- [ ] Add highlight groups to replicate the highlights from the actual `pydoc` command
- [ ] Allow for changing `q` keybinding
- [x] Change window height based on length of the `pydoc` output
- [ ] Add option to use vertical split or horizontal split
- [ ] Search for term under the cursor
