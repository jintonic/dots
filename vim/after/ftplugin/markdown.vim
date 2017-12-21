if exists("ftplugin_my_markdown_plugin")
  finish
endif
let ftplugin_my_markdown_plugin = 1 " Don't load it more than once

" a: automatically reformat a paragraph, 
" w: trailing space is used to indicate a continuous paragraph
setlocal formatoptions+=w
" show trailing space as .
setlocal list
setlocal lcs=trail:.
" add one space after period instead of two
setlocal nojoinspaces

setlocal spell

" vim-markdown settings
let g:vim_markdown_math = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_extensions_in_markdown = 1

" deal with long lines
set wrap
set linebreak " don't break words when wrapping
vnoremap j gj
vnoremap k gk
nnoremap j gj
nnoremap k gk
