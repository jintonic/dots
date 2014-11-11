" vim: fdm=marker:fen:fdl=0

" global setups {{{1
set vi='20,<50,s10,h,!,n~/.vim/viminfo "viminfo: save operation history
set dir=/tmp// " where to save the swp files
execute pathogen#infect()

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
set background=dark
set term=xterm-256color
colorscheme solarized
"set number

"set cul "cursorline: highlight the line where the cursor is, makes Vim slow
"au WinLeave * set nocul "when leave a window, disable cursorline
"au WinEnter * set cul

" disable tool bars in gvim
set go=
set guifont=Courier_New:h12:b

"set wildmenu "good for eyes, redundant if the following is set
set wildmode=list:longest,full

" airline
set laststatus=2
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1 " show buffer
"let g:airline#extensions#tabline#buffer_min_count = 2 " not show only 1 buffer
" map keys to open buffer quickly
"let g:airline#extensions#tabline#buffer_idx_mode = 1
"nmap <Leader>1 <Plug>AirlineSelectTab1
"nmap <Leader>2 <Plug>AirlineSelectTab2
"nmap <Leader>3 <Plug>AirlineSelectTab3
"nmap <Leader>4 <Plug>AirlineSelectTab4
"nmap <Leader>5 <Plug>AirlineSelectTab5
"nmap <Leader>6 <Plug>AirlineSelectTab6
"nmap <Leader>7 <Plug>AirlineSelectTab7
"nmap <Leader>8 <Plug>AirlineSelectTab8
"nmap <Leader>9 <Plug>AirlineSelectTab9

" bufferline
let g:bufferline_echo = 0

" spell {{{1
" set spell
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
" mapping of function keys
" first command toggles options, second reports status
nn <F6> :setlocal number! number?<CR>
nn <F7> :setlocal spell! spell?<CR>
nn <F8> :setlocal paste! paste?<CR>
set pastetoggle=<F8> " toggle past in insert mode

map \a :e %:p:s,.hh$,.X123X,:s,.cc$,.hh,:s,.X123X$,.cc,<CR>
map \s :e %<.cc<CR>
map \h :e %<.h<CR>
map \u :source ~/.vimrc<CR>
map \v :e ~/.vimrc<CR>
"map \g :execute "vimgrep /" . expand("<cword>") . "/j *.cc *.hh" <Bar> cw<CR> 
map \g :execute "grep! --exclude=*Dict*" expand("<cword>") "*.cc *.hh" <Bar>cw<CR>
map \m :make<CR>:cw<CR>
map <space> <C-W><C-W>

map \b :FufBuffer<CR>
map \f :FufFile<CR>
map \t :FufBufferTag<CR>

if has("win32unix")
  map \o :!cygstart.exe <cfile><CR><CR>
endif

"imap \{ {}<Esc>i
"imap \( ()<Esc>i
"imap \[ []<Esc>i
"imap \. ()->

"imap <Esc><BS> <C-W>
"imap <Esc>b <C-O>b
"imap <Esc>f <C-O>w
"imap <Esc>d <C-O>dw

cmap <Esc><BS> <C-W>
cmap <Esc>b <S-Left>
cmap <Esc>f <S-Right>
cmap <C-U> <C-E><C-U>

" super tab {{{1
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabNoCompleteAfter = [',', '\s', '\<', '\_^']

" mail {{{1
" Vim knows mutts naming scheme for temporary files. If a file fits that
" pattern, vim treats it as a mail
autocmd FileType mail set spell
autocmd FileType mail set fo+=aw

" task {{{1
let g:task_report_name="list"
let g:task_default_prompt= ['description', 'project']
