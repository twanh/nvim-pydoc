" Backwards compatibility - defines the :Pydoc command
" Modern installation uses lazy.nvim/packer with lua/pydoc.lua spec

if exists('g:loaded_pydoc') | finish | endif
let g:loaded_pydoc = 1

hi def link PydocHeader Title
hi def link PydocFunction Function

command! -nargs=1 -complete=shellcmd Pydoc lua require('pydoc.init').open_pydoc(<q-args>)
