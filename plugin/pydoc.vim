" Prevent the file from loading twise
if exists("g:loaded_pydoc") | finish | endif

hi def link PydocHeader Title 
hi def link PydocFunction Function 

command! -nargs=1 Pydoc lua require'pydoc'.open_pydoc(<f-args>)

let g:loaded_pydoc = 1
