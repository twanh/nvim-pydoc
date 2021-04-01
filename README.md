# Nvim Pydoc

> Still very much a work in progress 

Shows the `pydoc` documentation in a window in nvim.

## Installing

Make sure that you have `pydoc3` installed an is on your PATH. 

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

Simple execute the `:pydoc` command with the module (of function) you want the docs on

For example: `:pydoc os.path` 

You can quit the window simply by pressing `q` in `normal` mode. You can also quit the buffer in any way you like/are used to.

## TODO:

- [ ] Add the option to use custom path/commadn to pydoc (for using with `pydoc`/`pydoc3`, etc)
- [ ] Add highlight groups to replicate the highlights from the actual `pydoc` command
