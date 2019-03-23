setlocal tags=.git/scala-tags
setlocal foldmethod=indent

noremap <leader>+ :!ctags -R -f ./.git/scala-tags --languages=scala .<CR>

autocmd BufWritePost * Neomake!
autocmd BufWritePost * call Ensime_retypecheck()
