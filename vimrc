" vim: fdm=marker:fen:fdl=0

" global setups {{{1
set vi='20,<50,s10,h,!,n~/.vim/viminfo "viminfo: save operation history
set dir=/tmp// " where to save the swp files

autocmd BufAdd * :call <SID>DeleteBufferIfEmpty()
function! s:DeleteBufferIfEmpty()
  " If no name and no content
  if bufname('%') == '' && line('$') == 1 && getline(1) == ''
    bwipe
    " This will trigger filetype detection, mainly to trigger syntax highlighting
    doautocmd BufRead
  endif
endfunction

" plugins {{{1
" https://herringtondarkholme.github.io/2016/02/26/dein/
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim/dein')) " plugins' root path

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neosnippet.vim', {'on_i': 1})
call dein#add('Shougo/neosnippet-snippets', {'on_i': 1})
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('Konfekt/FastFold')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-liquid', {'on_ft': ['html']})
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-repeat')
call dein#add('godlygeek/tabular')
call dein#add('plasticboy/vim-markdown', {'on_ft':['markdown']})
call dein#add('ap/vim-buftabline')
call dein#add('altercation/vim-colors-solarized')
call dein#add('jlanzarotta/bufexplorer')
call dein#add('vim-scripts/taglist.vim')

call dein#end()

" buffer {{{1
" By default, if you modified the current buffer, you cannot switch to another
" one unless you save the current buffer or abandon your changes using command
" like :bn! This can be changed by setting
" either
"set awa "autowriteall: automatically save changes when switch to another buffer
" or
set hid "hidden: allow modified buffer to be hidden when switch to another one
" in case hid is set, you may want to 
set cf "confirm: popup a dialog asking what to do on unsaved files when :q

set ar "autoread: when a file has been detected to have been changed outside
       " of Vim and it has not been changed inside of Vim, automatically read
       " it again.

"set gd "gdefault: all matches in a line are substituted instead of one

set modeline " turn on modeline

" tty {{{1
set tf "ttyfast: Indicates a fast terminal connection.  More characters will
       "be sent to the screen for redrawing, instead of using insert/delete line
       "commands. 
set lz "lazyredraw: no redraw while executing macros, registers and other
       "commands that have not been typed.

" what you selected using your mouse cannot be pasted to other X applications
" if Vim is not compiled --with-x
"set ttymouse=xterm2
"set mouse=ar

" look {{{1
" disable tool bars in gvim
set go=
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Book\ 12,9x15

" 256 color is a must for solarized to work
if has("gui_running")
  set columns=94
  set number
else
  set term=xterm-256color
endif
set background=dark
silent! colorscheme solarized
"set number

"set cul "cursorline: highlight the line where the cursor is, makes Vim slow
"au WinLeave * set nocul "when leave a window, disable cursorline
"au WinEnter * set cul

"set wildmenu "good for eyes, redundant if the following is set
set wildmode=list:longest,full

" airline
let g:buftabline_show = 1
let g:buftabline_numbers = 2

" map keys to open buffer quickly
nmap <Leader>1 <Plug>BufTabLine.Go(1)
nmap <Leader>2 <Plug>BufTabLine.Go(2)
nmap <Leader>3 <Plug>BufTabLine.Go(3)
nmap <Leader>4 <Plug>BufTabLine.Go(4)
nmap <Leader>5 <Plug>BufTabLine.Go(5)
nmap <Leader>6 <Plug>BufTabLine.Go(6)
nmap <Leader>7 <Plug>BufTabLine.Go(7)
nmap <Leader>8 <Plug>BufTabLine.Go(8)
nmap <Leader>9 <Plug>BufTabLine.Go(9)

" spell {{{1
" set spell
set spellfile=~/.vim/spell/en.utf-8.add
" ]s next error
" [s previous error
" z= suggested corrections
" zg add word
" zug undo adding word
" zG add word for current buffer

" filetype {{{1
filetype on		" enable filetype detection
filetype plugin on	" load plugins according to file type
filetype indent on	" indent according to the file type
set shiftwidth=2	" for filetype indent on and << >> C-t and C-d
set smarttab		" insert space at the beginning of the line
" while insert tab at the other place
"set tabstop=3		" to show real tab as 3 spaces

set ww=<,>,[,]	  " type left/right at the beginning/end of the line goes to the pre/next line
" don't include h,l
set bs=2 		" allow bs go over start of insert

syntax on

set ruler
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set hlsearch 		" highlight search
set ignorecase

autocmd BufEnter * if expand('%:p') !~ '://' | cd %:p:h | endif

" folding {{{1
set fillchars=          "default vert:|,fold:-
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "don't fold by default
set foldlevel=1
" zR	Unfold all folded lines in file.
" za	Open/close (toggle) a folded group of lines.
" zA	Open a closed fold or close an open fold recursively.
" zc	Close a folded group of lines.
" zC	Close all folded lines recursively.
" zd	Delete a folded line.
" zD	Delete all folded lines recursively.
" zE	Eliminate all folded lines in file.
" zF	Create "N" folded lines.

" mapping {{{1

map \a :e %:p:s,.hh$,.X123X,:s,.cc$,.hh,:s,.X123X$,.cc,<CR>
map \s :e %<.cc<CR>
map \h :e %<.h<CR>
map \u :source ~/.vimrc<CR>
map \v :e ~/.vimrc<CR>
"map \g :execute "vimgrep /" . expand("<cword>") . "/j *.cc *.hh" <Bar> cw<CR> 
map \g :execute "grep! --exclude=*Dict*" expand("<cword>") "*.cc *.hh" <Bar>cw<CR>
map \m :make<CR>:cw<CR>
map <space> <C-E>

if has("win32unix")
  map \o :!cygstart.exe <cfile><CR><CR>
endif

cmap <Esc><BS> <C-W>
cmap <Esc>b <S-Left>
cmap <Esc>f <S-Right>
cmap <C-U> <C-E><C-U>

" Emacs key bindings in insert mode
im <C-B> <Left>
im <C-F> <Right>
im <C-A> <Home>
im <C-E> <End>

im <C-S> <Esc>:w<CR>li
im <C-Q> <Esc>:wq<CR>

" make gx working
if has('win32unix')
  let g:netrw_browsex_viewer="cygstart"
elseif has('macunix')
  let g:netrw_browsex_viewer="open"
else
  let g:netrw_browsex_viewer="mimeopen"
endif

" mail {{{1
" Vim knows mutts naming scheme for temporary files. If a file fits that
" pattern, vim treats it as a mail
autocmd FileType mail set spell
" I have to remove a option for it conflict with neocomplete
autocmd FileType mail set fo+=w

" fugitive {{{1
nmap <Leader>0 :Gstatus<CR>

" neosnippet {{{1
" use TAB to expand snippet or jump in between space holders
imap <expr><TAB> neosnippet#expandable() ?
      \ "\<Plug>(neosnippet_expand)" : neosnippet#jumpable() ?
      \ "\<Plug>(neosnippet_jump)" : "\<TAB>"
" Enable snipMate compatibility feature
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/after/snippets'

" buffer explorer {{{1
let g:bufExplorerDisableDefaultKeyMapping=1
nnoremap <leader>b :BufExplorer<CR>

" ctrlp {{{1
nnoremap <leader>f :CtrlPCurWD<CR>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" taglist {{{1
nnoremap <leader>t :TlistOpen<CR>

" https://github.com/hupili/evermd/tree/master/doc/howto-markdown-in-vim
let tlist_tex_settings = 'latex;c:contents;f:figures;t:tables'
let tlist_bib_settings = 'bibtex;e:entries;a:author;t:title'
let tlist_make_settings = 'make;m:macros;t:targets'
let tlist_markdown_settings = 'markdown;h:contents'

let Tlist_Close_On_Select = 1
let Tlist_Show_One_File = 1
let Tlist_Enable_Fold_Column = 0
