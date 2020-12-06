if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile WaveDumpConfig*.txt         setfiletype WDcfg
augroup END
