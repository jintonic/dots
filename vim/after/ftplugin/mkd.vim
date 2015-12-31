" a: automatically reformat a paragraph, 
" w: trailing space is used to indicate a continuous paragraph
setlocal formatoptions+=wa
" show trailing space as .
setlocal list
setlocal lcs=trail:.
" add one space after period instead of two
setlocal nojoinspaces

setlocal spell

let g:vim_markdown_frontmatter=1
