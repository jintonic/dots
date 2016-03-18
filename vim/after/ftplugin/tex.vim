if exists("ftplugin_my_tex_vim")
  finish
endif
let ftplugin_my_tex_vim = 1 " Don't load it more than once

" :help 'complete'
setlocal dictionary+=~/.vim/dic/latex.dic
setlocal complete+=k

" a: automatically reformat a paragraph, 
" w: trailing space is used to indicate a continuous paragraph
setlocal formatoptions+=w
" show trailing space as .
setlocal list
setlocal lcs=trail:.

" disable automatical indent of \item provided by indent/tex.vim
let g:tex_indent_items=0
" disable automatical indent of the following items
let g:tex_noindent_env='document\|verbatim\|frame'
" disable automatical conversion of 8 spaces to a tab
setlocal noexpandtab

" vim -> xdvi
map \ls :exe '!xdvi -sourceposition '.line(".").expand("%")<CR><CR>
" xdvi -> vim
" vim has to be run in server mode: 
" 	vim --servername VIM file.tex
" or
" 	gvim file.tex (default server name is GVIM)
" or
" 	gvim -v --servername VIM file.tex (run gvim in terminal)
" 	
" file has to be compiled with src option
" 	$ latex --src file.tex
" xdvi has to be run as: 
" 	xdvi -editor "gvim --servername VIM --remote-silent +%l %f" file.dvi
" C-leftClick in xdvi will bring vim to the right position
"
" The last two can be set in ~/.latexmkrc
" 	$latex='latex --src %O %S';
" 	$dvi_previewer='start xdvi -editor "gvim --servername VIM --remote-silent +%l %f" %O %S';
" To use latexmk setting, one has to run latexmk first:
" 	latexmk -dvi -pvc file

" for fuzzy finder to work with ctags for latex
"let g:fuf_buffertag__tex='--language-force=latex'
" one has to put the following to ~/.ctags at the same time
" --langdef=latex
" --langmap=latex:.tex
" --regex-latex=/\\label\{([^}]*)\}/\1/l,label/
" --regex-latex=/\\section\{([^}]*)\}/\1/s,section/
" --regex-latex=/\\subsection\{([^}]*)\}/\1/t,subsection/
" --regex-latex=/\\subsubsection\{([^}]*)\}/\1/u,subsubsection/
" --regex-latex=/\\section\*\{([^}]*)\}/\1/s,section/
" --regex-latex=/\\subsection\*\{([^}]*)\}/\1/t,subsection/
" --regex-latex=/\\subsubsection\*\{([^}]*)\}/\1/u,subsubsection/

setlocal spell
" do not spell check comments
let g:tex_comment_nospell=1

" enable folder
"let g:tex_fold_enabled=1
"setlocal fdm=syntax fen fdl=0
" disabled due to conflict with neocomplete

" supertab
"let g:SuperTabNoCompleteAfter = [',', '\s', '\<', '\_^', '\.']

" deal with long lines
set wrap
set linebreak " don't break words when wrapping
vnoremap j gj
vnoremap k gk
nnoremap j gj
nnoremap k gk
