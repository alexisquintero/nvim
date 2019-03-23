autocmd BufWritePost * Neomake!
autocmd BufWritePost * call Ensime_retypecheck()
