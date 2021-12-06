if exists("did_load_filetypes_userafter")
  finish
endif
let did_load_filetypes_userafter = 1
augroup filetypedetect
  au BufNewFile,BufRead *.tg set filetype=tg
  au! BufNewFile,BufRead WaveDumpConfig*.txt if &ft == 'text' | set ft=WDcfg | endif
augroup END
