set makeprg=plantuml\ % " check if make is already set
autocmd BufWritePost <buffer> silent! make
