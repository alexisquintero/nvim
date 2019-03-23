setlocal tags=.git/scala-tags

noremap <leader>+ :!ctags -R -f ./.git/scala-tags --languages=scala .<CR>

autocmd BufWritePost * Neomake!
autocmd BufWritePost * call Ensime_retypecheck()
